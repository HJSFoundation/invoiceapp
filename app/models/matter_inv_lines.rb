class MatterInvLines < ActiveRecord::Base
  belongs_to :matter
  belongs_to :invoice_line
  # attr_accessible :title, :body
end
