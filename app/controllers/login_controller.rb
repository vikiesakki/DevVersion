class LoginController < ApplicationController
  def index
    Resque.enqueue(TestResque)
  end
  def login_check
    render plain: params
  end
end
