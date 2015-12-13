class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @outline = Outline.find(params[:outline_id])
    @user = current_user
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @user = current_user
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @user, notice: 'Outline was successfully purchased.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
  end

  private

  def purchase_params
      params.permit(:outline_id, :user_id)
  end
end
