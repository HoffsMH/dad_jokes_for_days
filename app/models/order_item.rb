class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :joke
  belongs_to :order
end
