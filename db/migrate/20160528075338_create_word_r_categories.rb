class CreateWordRCategories < ActiveRecord::Migration
  def change
    create_table :word_r_categories do |t|
      t.integer  :word_id
      t.integer  :category_id
      t.timestamps null: false
    end
  end
end
