class Project < ActiveRecord::Base
	has_many :project_members, :dependent=>:destroy
	has_many :documents
	has_many :users , through: :project_members
	validates :name,:project_type,:project_code,:start_date,:end_date,:sow_value,:presence=>true

end
