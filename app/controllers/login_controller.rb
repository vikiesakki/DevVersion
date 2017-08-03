require "base64"
class LoginController < ApplicationController
	#before_filter :user_check
	include ActionView::Helpers::SanitizeHelper
	def index
		
	end
	def login
		username = strip_tags(params[:login][:username])
		pass = Base64.encode64(strip_tags(params[:login][:password])).strip
		puts pass
		status = login_check(username,pass)
		if status == 'admin'
			redirect_to :controller=> :admin
		elsif status == 'user'
			redirect_to :controller=>:user
		elsif !status
			flash[:error] = t(:label_login_error)
			render :index
		end
	end

	def logout
		session.clear
		redirect_to :controller=>:login
	end

	private

	def login_check(username,password)
		begin
			user_data = User.where("username = ? AND password = ?",username,password).first
			if not user_data.nil?
				session[:user_id] = user_data.id
				session[:user_type] = user_data.user_type
				session[:user_role] = user_data.role
				return user_data.user_type
			end
		rescue
			return false
		end
	end

	def user_check
		unless session[:user_type].nil?
			if session[:user_type] == 'admin'
				redirect_to :controller=> :admin
			elsif session[:user_type] == 'user'
				redirect_to :controller=>:user
			end
		end
	end

end
