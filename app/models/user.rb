class User < ActiveRecord::Base
  has_many :tasks
  has_many :projects, through: :tasks
  has_secure_password

  def self.exists?(email)
    User.find_by(email: email) ? true : false
  end

  def self.is_logged_in?(session)
    session[:id] ? true : false
  end
end