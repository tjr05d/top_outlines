class User < ActiveRecord::Base
  belongs_to :school
  has_secure_password
end
