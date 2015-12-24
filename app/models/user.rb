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

  def cart_total_price
    total_price = 0
    get_cart_outlines.each { |outline| total_price += outline.price.to_i}
    total_price
  end

  def get_cart_outlines
    cart_ids = $redis.smembers "cart#{id}"
    Outline.find(cart_ids)
  end

  def purchase_cart_outlines!
  get_cart_outlines.each { |outline| purchase(outline) }
  $redis.del "cart#{id}"
  end

  def purchase(outline)
    outlines << outline unless purchase?(outline)
  end

  def purchase?(outline)
    outlines.include?(outline)
  end
end
