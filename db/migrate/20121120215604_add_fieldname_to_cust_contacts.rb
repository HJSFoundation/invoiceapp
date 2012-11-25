class AddFieldnameToCustContacts < ActiveRecord::Migration
  def change
    add_column :cust_contacts, :email, :string
    add_column :cust_contacts, :facebook_profile, :string
    add_column :cust_contacts, :preferred, :string
  end
end
