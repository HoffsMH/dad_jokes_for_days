class AddDaoToItems < ActiveRecord::Migration
  def change
    add_column :items, :dao, :string
  end
end
