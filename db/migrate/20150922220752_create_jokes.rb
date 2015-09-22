class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.string :lead
      t.string :punchline

      t.timestamps null: false
    end
  end
end
