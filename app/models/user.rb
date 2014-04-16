class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :email, :presence => true
  validates_uniqueness_of :username

  has_many :tweets

  after_create :send_signup_confirmation

  def send_signup_confirmation
    UserMailer.signup_confirmation(self).deliver
  end
end
