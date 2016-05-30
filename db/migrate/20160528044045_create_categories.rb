class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, limit: 50
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
