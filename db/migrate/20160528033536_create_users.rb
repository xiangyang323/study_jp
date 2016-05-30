class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, limit: 50
      t.string :password, limit:255
      t.timestamps null: false
    end
  end
end
