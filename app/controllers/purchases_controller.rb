class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @outline = Outline.find(params[:outline_id])
    @user = current_user
  end

  def create
    @user = current_user
    @client_token = Braintree::ClientToken.generate(
    :customer_id => @user.id,
    :verify_card => true
)
  end

  def destroy
  end

  private

  def purchase_params
      params.permit(:outline_id, :user_id)
  end
end
