class Purchase < ActiveRecord::Base
  attr_accessible :purchaser_name, :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name



end