class UserController < ApplicationController
  def index
    @users = User.all
  end
  def create
    @users = User.new(allowed_params)
    if @users.save
      redirect_to :controller=> :user
    else
      render :new
    end
  end
  def new
    @users = User.new
  end
  def show
    @users = User.all
  end
  private
  def allowed_params
  	params.required(:users).permit(:username,:mobile,:address,:email)
  end
end
