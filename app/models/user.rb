class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :email, :presence => true
  validates_uniqueness_of :username
end
