class User < ActiveRecord::Base

 validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
uniqueness: { case_sensitive: false }
=begin
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
=end
  before_save { |user| user.email = email.downcase }
   
  has_many :microposts


end
