class AddSubtotalToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :subtotal, :decimal
  end
end
