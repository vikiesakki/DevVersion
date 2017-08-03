class CreateDocuments < ActiveRecord::Migration
  def up
  	unless table_exists?(:documnets)
	    create_table :documents do |t|
	    	t.integer :project_id,:uploaded_by
	    	t.string :document
	    end
	end
  end
  def down
  	if table_exists?(:documnets)
  		drop_table :documents
  	end
  end
end
