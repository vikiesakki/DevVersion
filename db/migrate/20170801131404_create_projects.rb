class CreateProjects < ActiveRecord::Migration
  def change
    unless table_exists?(:projects)
	    create_table :projects do |t|
	    	t.string :name,:project_type,:progress,:project_code
	    	t.integer :created_by,:updated_by
	    	t.date :start_date,:end_date
	    	t.float :sow_value
	    end
	end
  end
  def down
  	if table_exists?(:projects)
  		drop_table :projects
  	end
  end
end
