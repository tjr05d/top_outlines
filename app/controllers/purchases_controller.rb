class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @outline = Outline.find(params[:outline_id])
    @user = current_user
  end

  end

  def destroy
  end

  private

  def purchase_params
      params.permit(:outline_id, :user_id)
  end
end
