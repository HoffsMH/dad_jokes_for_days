class AddDaoToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :dao, :string
  end
end
