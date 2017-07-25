class CreateUsers < ActiveRecord::Migration
  def up
  	unless table_exists?(:users)
	    create_table :users do |t|
	      t.string :username,:password,:email,:address
	      t.integer :mobile
	    end
	end
  end
  def down
  	if table_exists?(:users)
  		drop_table :users
  	end
  end
end
