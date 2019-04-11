class Customer < ApplicationRecord
  validates :pGUID, :pAccName, :pPartner, :name, :business_name,
            :tel_number, :email, presence: true
  validates :name, :business_name, length: { maximum: 100 }
end
