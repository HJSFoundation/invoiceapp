class Customer < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :city, :name, :phone_number, :state, :zip
  has_many :cust_contacts
  has_many :matters
  has_many :invoice_headers
end
