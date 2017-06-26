class User < ActiveRecord::Base
  validates :username,:mobile, :presence=>true
end
