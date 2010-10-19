class User < ActiveRecord::Base

  validates_presence_of :username, :password, :first_name, :last_name, :level, :email

  has_many :notes
  has_many :comments

end
