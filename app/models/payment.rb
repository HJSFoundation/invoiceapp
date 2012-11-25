class Payment < ActiveRecord::Base
  attr_accessible :invoice_header, :payment_amount, :payment_date, :payment_notes, :payment_type
  belongs_to :invoice_header
end
