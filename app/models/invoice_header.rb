class InvoiceHeader < ActiveRecord::Base
  attr_accessible :customer_id, :invoice_total
  has_many :invoice_lines, :dependent => :destroy
  has_many :payments
  belongs_to :customer
  #has_many :matters, :through => :invoice_lines
  #has_many :billers, :through => :invoice_lines
end
