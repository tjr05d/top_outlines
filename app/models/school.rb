class School < ActiveRecord::Base
  has_many :courses
  has_many :users
  has_many :professors 
end
