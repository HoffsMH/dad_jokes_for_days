class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :joke
  belongs_to :order

  validates :item_id, :joke_id, :quantity, presence: true
  def total
    quantity * item.price
  end
end
