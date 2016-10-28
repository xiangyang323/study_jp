class UpdateSentenceWords < ActiveRecord::Migration
  def change
    remove_column :sentences, :wrods
    add_column :sentences, :words, :string
  end
end
