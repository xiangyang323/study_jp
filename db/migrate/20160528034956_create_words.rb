class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :kana, limit: 50
      t.string :word_jp, limit:50
      t.string :word_ch, limit: 50
      t.string :type, limit:10
      t.string :location, limit: 50
      t.integer :level
      t.timestamps null: false
    end
  end
end
