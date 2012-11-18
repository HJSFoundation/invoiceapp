class Invoice < ActiveRecord::Base
  attr_accessible :customer_id, :item, :price, :quantity
end
