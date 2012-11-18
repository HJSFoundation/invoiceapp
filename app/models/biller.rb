class Biller < ActiveRecord::Base
  attr_accessible :biller_name, :rate
  belongs_to :invoice_lines
end
