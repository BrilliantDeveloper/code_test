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
      byebug
      resp = HTTParty.post(ENV['LEAD_API_URI'], {
          body: create_request_body(@customer),
          headers: {
            'Content-Type' => 'application/x-www-form-urlencoded',
            'charset' => 'utf-8'
          }
      })
      process_response(resp)
    else
      render 'new'
    end
    # byebug
  end

  private

  def process_response(resp)
    # success response
    byebug
    if resp.code == 201
      # display success message
      flash[:success] = "Thank you for your submission! We'll contact you on #{@customer.contact_time}"
      redirect_to root_path
    end

    if resp.code == 400

    end
  end

  def create_request_body(customer)
    body = "access_token=#{ENV['LEAD_API_ACCESS_TOKEN']}&pGUID=#{customer.pGUID}"
    body += "&pAccName=#{customer.pAccName}&pPartner=#{customer.pPartner}"
    body += "&name=#{customer.name}&business_name=#{customer.business_name}"
    body += "&telephone_number=#{customer.tel_number}&email=#{customer.email}"
    body += "&contact_time=#{customer.contact_time}&notes=#{customer.notes}"
    body += "&reference=#{customer.reference}"
  end

  def customer_params
    params.require(:customer).permit(:pAccName, :pPartner, :name,
                                      :business_name, :tel_number,
                                      :email, :contact_time,
                                      :notes, :reference)
  end
end
