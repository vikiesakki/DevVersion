module ApplicationHelper
	def get_user_details
		begin
			user_id = session[:user_id]
			@user = User.find(user_id)
		rescue Exception => e
			redirect_to :controller=>:login
		end
	end
	def check_admin
		if not session[:user_type]=='admin'
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end
	def check_manager
		if not session[:user_role]=='Project Manager'
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end
	def get_members
		data = User.select("users.username,users.id")
				   .joins("LEFT JOIN project_members pm ON users.id = pm.user_id ")
				   .where("pm.user_id is null AND users.role='Developer'")
				   .order("users.username")
		return data
	end
end
