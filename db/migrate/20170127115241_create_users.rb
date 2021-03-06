class CreateUsers < ActiveRecord::Migration

  def up
    unless table_exists?(:users)
      create_table :users do |t|
        t.string :username
        t.text :status
        t.integer :mobile,:location_id
        t.string :address
        t.string :email
      end
    end
  end
  def down
    if table_exists?(:users)
      drop_table :users
    end
  end
end
