class ChangeContactTimeType < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :contact_time
    add_column :customers, :contact_time, :datetime
  end
end
