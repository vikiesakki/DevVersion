class User < ActiveRecord::Base
	belongs_to :location
	has_many :project_members, :dependent=>	:destroy
	has_many :projects, through: :project_members
	validates :username,:password,:email,:address,:role,:user_type,:location_id,:mobile,:presence=>true
	validates :email,:uniqueness=>true,:on=>:create
	validates :mobile,length: { is: 10 }
	validate :encrpt_password,:on=>:update

	def encrpt_password
		self.password = Base64.encode64(self.password).strip
	end
	def self.current
    	return Thread.current[:current_user]
  	end
end
