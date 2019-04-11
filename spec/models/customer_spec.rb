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

  it 'is invalid without a pAccName' do
    lead = Customer.new(
                       pAccName: nil
    )
    lead.valid?
    expect(lead.errors[:pAccName]).to include("can't be blank")
  end

  it 'is invalid without a pPartner' do
    lead = Customer.new(
                       pPartner: nil
    )
    lead.valid?
    expect(lead.errors[:pPartner]).to include("can't be blank")
  end

  it 'is invalid without a name' do
    lead = Customer.new(
                       name: nil
    )
    lead.valid?
    expect(lead.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a business_name' do
    lead = Customer.new(
                       business_name: nil
    )
    lead.valid?
    expect(lead.errors[:business_name]).to include("can't be blank")
  end

  it 'is invalid without a tel_number' do
    lead = Customer.new(
                       tel_number: nil
    )
    lead.valid?
    expect(lead.errors[:tel_number]).to include("can't be blank")
  end

  it 'is invalid without an email' do
    lead = Customer.new(
                       email: nil
    )
    lead.valid?
    expect(lead.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a name of more than 100 chars' do
    lead = Customer.new(
                       name: "e" * 101
    )
    lead.valid?
    expect(lead.errors[:name]).to include("is too long (maximum is 100 characters)")
  end
  it 'is invalid with a business_name of more than 100 chars' do
    lead = Customer.new(
                       business_name: "b" * 101
    )
    lead.valid?
    expect(lead.errors[:business_name]).to include("is too long (maximum is 100 characters)")
  end
  it 'is invalid with a tel_number of more than 13 chars'
  it 'is invalid with an email of more than 80 chars'
end
