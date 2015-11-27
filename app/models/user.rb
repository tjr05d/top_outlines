class User < ActiveRecord::Base
  belongs_to :school
  has_secure_password
  validates :first_name,
            presence: true
  validates :last_name,
            presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: ^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$ }

  def to_s
    "#{first_name} #{last_name}"
  end 
end
