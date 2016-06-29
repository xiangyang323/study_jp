class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|	
	  t.string :word_ids
      t.string :wrods
      t.string :sentence
      t.string :location, limit: 50
      t.timestamps null: false
    end
  end
end
