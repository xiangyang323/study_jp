class CreateVerbTypes < ActiveRecord::Migration
  def change
    create_table :verb_types do |t|
      t.integer :word_id
      t.string :ma_type, limit:50
      t.string :te_type, limit: 50
      t.string :na_type, limit:10
      t.string :ta_type, limit: 50
      t.timestamps null: false
    end
  end
end
