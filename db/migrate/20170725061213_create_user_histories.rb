class CreateUserHistories < ActiveRecord::Migration
  def up
  	unless table_exists?(:user_histories)
	    create_table :user_histories do |t|
	      t.integer :user_id,:login_attempts,:login_times
	      t.string :login_agent
	    end
	end
  end
  def down
  	if table_exists?(:user_histories)
  		drop_table :user_histories
  	end
  end
end
