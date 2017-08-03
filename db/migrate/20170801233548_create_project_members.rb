class CreateProjectMembers < ActiveRecord::Migration
  def up
  	unless table_exists?(:project_members)
	    create_table :project_members do |t|
	    	t.integer :project_id,:user_id
	    end
	end
  end
  def down
  	if table_exists?(:project_members)
  		drop_table :project_members
  	end
  end
end
