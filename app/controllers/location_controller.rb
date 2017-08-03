require 'will_paginate'
class LocationController < ApplicationController
	include ApplicationHelper
	before_filter :get_user_details,:check_admin
	def index
		@location = Location.paginate(:page => params[:page],:per_page => 10)
	end
	def new
		@location = Location.new
	end

	def edit
		begin
			id = params[:id].to_i
			@location = Location.find(id)
		rescue Exception => e
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end

	def create
		@location = Location.new(user_params)
		if @location.save
			flash[:success_create] = t(:success_create)
			redirect_to action: :index
		else
			render :new
		end
	end

	def update
		begin
			id = params[:id].to_i
			@location = Location.find(id)
			if @location.update(user_params)
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
			@location = Location.find(id)
			@location.destroy
			redirect_to action: :index
		rescue Exception => e
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end

	private
	def user_params
		params.require(:location).permit(:name)
	end
end
