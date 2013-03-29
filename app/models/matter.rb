class Matter < ActiveRecord::Base
  attr_accessible :customer_id, :matter
  belongs_to :customer
  #has_and_belongs_to_many :invoice_lines
end
