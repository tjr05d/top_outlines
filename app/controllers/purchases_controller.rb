class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @outline = Outline.find(params[:outline_id])
    @user = current_user
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @user = current_user
      raise
      if @purchase.save
        redirect_to @purchase.paypal_url(@user)
    else
      render :new
      end
  end

  def destroy
  end

  private

  def purchase_params
      params.permit(:outline_id, :user_id)
  end
end
