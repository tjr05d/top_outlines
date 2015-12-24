class User < ActiveRecord::Base
  belongs_to :school
  has_many :outlines
  has_many :purchases
  has_secure_password
  validates :first_name,
            presence: true
  validates :last_name,
            presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
            with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }

  def to_s
    "#{first_name} #{last_name}"
  end

  def cart_count
    $redis.scard "cart#{id}"
  end
  
end
