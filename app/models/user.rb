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
#calculates the total price of the outlines in the cart
  def cart_total_price
    total_price = 0
    get_cart_outlines.each { |outline| total_price += outline.price.to_i}
    total_price
  end

  def get_cart_outlines
    cart_ids = $redis.smembers "cart#{id}"
    Outline.find(cart_ids)
  end
#adds a sale for each outline purchased once the transaction has been processed
#also create the new instance of a purchase in the purchase model
  def account_for_outline_purchase(user)
    get_cart_outlines.each do |outline|
      outline.sales +=1
      outline.save
      @purchase = Purchase.new(user_id: user.id, outline_id: outline.id)
      @purchase.save
    end
  end
#removes the outlines from the shopping cart once a transactions have been successfully processed
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
