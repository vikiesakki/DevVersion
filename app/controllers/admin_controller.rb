class AdminController < ApplicationController
	include ApplicationHelper
	before_filter :get_user_details,:check_admin
	def index
		
	end
end
