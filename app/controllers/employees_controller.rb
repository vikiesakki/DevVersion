class EmployeesController < ApplicationController
	include ApplicationHelper
	before_filter :get_user_details,:check_admin
	def index
		@users = User.paginate(:page => params[:page], :per_page => 10)
	end
	def new
		@users = User.new
	end
	def create
		@users = User.new(user_params)
		@users.password = Base64.encode64(params[:user][:password]).strip
		@users.user_type = "user"
		if @users.save
			redirect_to action: :index
		else
			render :new
		end
	end
	def edit
		begin
			id = params[:id].to_i
			@users = User.find(id)
		rescue Exception => e
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end

	def update
		begin
			id = params[:id].to_i
			@users = User.find(id)
			if @users.update(user_params)
				redirect_to action: :index
			else
				render :action=>:edit,:id=> params[:id].to_i
			end
		rescue Exception => e
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end

	def destroy
		begin
			id = params[:id].to_i
			@users = User.find(id)
			@users.destroy
			redirect_to action: :index
		rescue Exception => e
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end

	private
	def user_params
		params.require(:user).permit(:username,:password,:email,:address,:role,:user_type,:location_id,:mobile)
	end
end
