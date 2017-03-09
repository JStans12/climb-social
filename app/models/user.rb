class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :auth_token
  validates_uniqueness_of :auth_token
end
