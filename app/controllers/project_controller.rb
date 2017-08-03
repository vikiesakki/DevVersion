class ProjectController < ApplicationController
	include ApplicationHelper
	before_filter :get_user_details
	before_filter :check_manager, :only=>[:new,:create,:destroy]
	def index
		@projects = Project.paginate(:page => params[:page],:per_page => 10)
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(user_params)
		@project.created_by = @user.id
		@project.updated_by = @user.id
		@project.progress = 0
		if @project.save
			flash[:success_create] = t(:success_create)
			redirect_to action: :index
		else
			render :new
		end
	end

	def edit
		begin
			id = params[:id].to_i
			@project = Project.find(id)
		rescue Exception => e
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end

	def update
		begin
			id = params[:id].to_i
			@project = Project.find(id)
			if @project.update(user_params)
				redirect_to action: :index
			else
				render :action=>:edit,:id=> params[:id].to_i
			end
		rescue Exception => e
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end
	def members
		begin
			id = params[:id].to_i
			@project = Project.find(id)
			@member = ProjectMember.new
			@members = @project.project_members
		rescue Exception => e
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end
	def add_members
		begin
			id = params[:project_member][:project_id].to_i
			@project = Project.find(id)
			@members = @project.project_members
			@member = ProjectMember.new(member_params)
			@member.save
			redirect_to :action=>:members,:id=>id
		rescue Exception => e
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end
	def delete_members
		begin
			id = params[:id].to_i
			@member = ProjectMember.find(id)
			@member.destroy
			redirect_to :action=>:members,:id=>@member.project_id
		rescue Exception => e
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end
	def upload_documents
		@document = Document.new(document_params)
		@document.uploaded_by = @user.id
		if @document.save
			redirect_to :action=>:show,:id=>@document.project_id
		end
	end
	def show
		begin
			id = params[:id].to_i
			@project = Project.find(id)
			@document = Document.new
		rescue Exception => e
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end
	def destroy
		begin
			id = params[:id].to_i
			@project = Project.find(id)
			@project.destroy
			redirect_to action: :index
		rescue Exception => e
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
	end

	private

	def user_params
		params.require(:project).permit(:name,:project_type,:progress,:project_code,:start_date,:end_date,:sow_value)
	end

	def member_params
		params.require(:project_member).permit(:user_id,:project_id)
	end

	def document_params
		params.require(:document).permit(:project_id,:document)
	end
end
