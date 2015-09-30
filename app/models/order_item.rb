class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :joke
  belongs_to :order
  before_validation :fill_subtotal

  validates :item_id, :joke_id, :quantity,  presence: true
  def total
    if item && quantity
      quantity * item.price
    else
      0
    end
  end

  def fill_subtotal
    self.subtotal = total
  end
end
