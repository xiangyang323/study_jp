class UpdateUserWords < ActiveRecord::Migration
  def change
    remove_column :user_words, :type
    add_column :user_words, :do_type, :integer
  end
end
