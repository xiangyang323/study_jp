class UpdateWord < ActiveRecord::Migration
  def up
    remove_column :words, :type
    add_column :words, :classify, :string, limit: 50
  end
end
