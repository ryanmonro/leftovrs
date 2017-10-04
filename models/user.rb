class User < ActiveRecord::Base
  has_secure_password
  has_many :items
  has_many :purchases
  # this adds two methods to user objects:
  # password
  # authenticate()

end