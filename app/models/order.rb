class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items

  validates :user_id, :status, presence: true

  def quantity
    order_items.sum(:quantity)
  end

  def total
    order_items.sum(:subtotal)
  end

  def ordered

  end

  def paid

  end

  def cancelled

  end

  def completed

  end

  def status(status)

  end

end
