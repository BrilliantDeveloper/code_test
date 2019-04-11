require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'is valid with a pGUID, pAccName, pPartner, name, business_name, tel_number and  email' do
    customer = Customer.new(
        pGUID:          'idifhghdis22828d',
        pAccName:       'Test Account',
        pPartner:       'Test Partner',
        name:           'Sterling Archer',
        business_name:  'Spy Agency',
        tel_number:     '07880553235',
        email:          'sarcher@example.com'
    )
    expect(customer).to be_valid
  end

  it 'is invalid without a pGUID' do
    lead = Customer.new(
        pGUID: nil
    )

    lead.valid?
    expect(lead.errors[:pGUID]).to include("can't be blank")

  end
  it 'is invalid without a pAccName'
  it 'is invalid without a pPartner'
  it 'is invalid without a name'
  it 'is invalid without a business_name'
  it 'is invalid without a tel_number'
  it 'is invalid without an email'

  it 'is invalid with a name of more than 100 chars'
  it 'is invalid with a business_name of more than 100 chars'
  it 'is invalid with a tel_number of more than 13 chars'
  it 'is invalid with an email of more than 80 chars'
end
