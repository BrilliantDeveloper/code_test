class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.pGUID = SecureRandom.uuid
    if @customer.valid?
      # submit to api

      resp = HTTParty.post(ENV['LEAD_API_URI'], {
          body: "access_token=#{ENV['LEAD_API_ACCESS_TOKEN']}&pGUID=#{@customer.pGUID}&pAccName=#{@customer.pAccName}&pPartner=#{@customer.pPartner}",
          headers: {
            'Content-Type' => 'application/x-www-form-urlencoded',
            'charset' => 'utf-8'
          }
      })
      byebug
    else
      render 'new'
    end
    # byebug
  end

  private

  def customer_params
    params.require(:customer).permit(:pAccName, :pPartner, :name,
                                      :business_name, :tel_number,
                                      :email, :contact_time,
                                      :notes, :reference)
  end
end
