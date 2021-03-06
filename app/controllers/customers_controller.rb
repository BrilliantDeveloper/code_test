class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.pGUID = SecureRandom.uuid
    resp = nil

    if @customer.valid?
      # submit to api

      resp = HTTParty.post(ENV['LEAD_API_URI'], {
          body: create_request_body(@customer),
          headers: {
            'Content-Type' => 'application/x-www-form-urlencoded',
            'charset' => 'utf-8'
          }
      })
      # check response received
      process_response(resp)
    else
      render 'new'
    end
  end

  private

  def process_response(resp)
    # success response
    error_string = "We're sorry but we're unable to accept your contact request" \
                 " at this time. Please try again later."
    if resp.code == 201
      # display success message
      flash[:success] = "#{@customer.name}, Thank you for your submission!" \
                        " We'll contact you on #{@customer.contact_time.strftime('%Y-%m-%d %H:%M:%S')}"
      redirect_to root_path
    else
      flash[:danger] = error_string
      render 'new'
    end

  end

  def create_request_body(customer)
    body = "access_token=#{ENV['LEAD_API_ACCESS_TOKEN']}&pGUID=#{customer.pGUID}" \
        "&pAccName=#{customer.pAccName}&pPartner=#{customer.pPartner}" \
        "&name=#{customer.name}&business_name=#{customer.business_name}" \
        "&telephone_number=#{customer.tel_number}&email=#{customer.email}" \
        "&contact_time=#{customer.contact_time.strftime('%Y-%m-%d %H:%M:%S')}" \
        "&notes=#{customer.notes}" \
        "&reference=#{customer.reference}"
  end

  def customer_params
    params.require(:customer).permit(:pAccName, :pPartner, :name,
                                      :business_name, :tel_number,
                                      :email, :contact_time,
                                      :notes, :reference)
  end
end
