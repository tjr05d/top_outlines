class TransactionsController < ApplicationController
  before_action :check_cart!
  
  def new
  end

  private

  def check_cart!
    if current_user.get_cart_outlines.blank?
      redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
   end
 end
end
