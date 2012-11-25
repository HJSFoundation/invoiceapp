class CreateCustContacts < ActiveRecord::Migration
  def change
    create_table :cust_contacts do |t|
      t.string :name
      t.string :phone
      t.boolean :primary
      t.integer :customer_id

      t.timestamps
    end
  end
end
