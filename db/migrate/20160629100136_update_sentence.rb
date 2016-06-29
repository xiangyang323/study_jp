class UpdateSentence < ActiveRecord::Migration
  def change
  	add_column :sentences, :translate, :string
  end
end
