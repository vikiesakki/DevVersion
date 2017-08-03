class UserController < ApplicationController
	include ApplicationHelper
	before_filter :get_user_details
	def index
		if session[:user_role]=='Project Manager'
			@projects = Project.where("created_by = ?",@user.id)
		else
			@projects = ProjectMember.where("user_id = ?",@user.id)
		end
	end
end
