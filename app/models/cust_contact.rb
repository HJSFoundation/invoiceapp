class CustContact < ActiveRecord::Base
  validates :name, :presence => true, :length => { :minimum => 3 }
  validates :phone, :presence => true, :numericality => true, :length => { :minimum => 10 }
  
  attr_accessible :customer_id, :name, :phone, :primary
  belongs_to :customer
end
