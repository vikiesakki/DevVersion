class CreateLocations < ActiveRecord::Migration
  def up
  	unless table_exists?(:locations)
	    create_table :locations do |t|
	    	t.string :name
	    end
	end
  end
  def down
  	if table_exists?(:locations)
  		drop_table :locations
  	end
  end
end
