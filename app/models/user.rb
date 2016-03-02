class User < ActiveRecord::Base
  belongs_to :school
  has_many :outlines, :class_name => 'Outline', :foreign_key => 'seller_id'
  has_many :purchases, :class_name => 'Purchase', :foreign_key => 'buyer_id'
  # has_many :sales, :class_name => 'Purchase', :through => :outlines
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

#   def cart_count
#     $redis.scard "cart#{id}"
#   end
# #calculates the total price of the outlines in the cart
#   def cart_total_price
#     total_price = 0
#     get_cart_outlines.each { |outline| total_price += outline.price.to_i}
#     total_price
#   end
#
#   def get_cart_outlines
#     cart_ids = $redis.smembers "cart#{id}"
#     Outline.find(cart_ids)
#   end
# #adds a sale for each outline purchased once the transaction has been processed
# #also create the new instance of a purchase in the purchase model
#   def purchase_outlines(user)
#     get_cart_outlines.each do |outline|
#       @purchase = Purchase.new(buyer_id: user.id, outline_id: outline.id, price: outline.price)
#       @purchase.save
#       $redis.del "cart#{id}"
#     end
#   end
end
