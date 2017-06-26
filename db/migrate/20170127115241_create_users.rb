class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.text :status
      t.integer :mobile
      t.string :address
      t.string :email
      t.timestamps null: false
    end
  end
end
