class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :pGUID
      t.string :pAccName
      t.string :pPartner
      t.string :name
      t.string :business_name
      t.string :tel_number
      t.string :email
      t.string :contact_time
      t.text :notes
      t.string :reference

      t.timestamps
    end
  end
end
