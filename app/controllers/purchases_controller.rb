# class PurchasesController < ApplicationController
#   def new
#     @outline = Outline.find(params[:outline_id])
#     @user = current_user
#     @purchase = Purchase.new(outline_id: @outline.id, buyer_id: @user.id, seller_id: @outline.seller, price: @outline.price)
#   end
#
#   def create
#     @outline = Outline.find(params[:outline_id])
#     @user = current_user
#     @purchase = Purchase.new(outline_id: @outline.id, buyer_id: @user.id, seller_id: @outline.seller.id, price: @outline.price)
#
#     if @purchase.save
#       format.html { redirect_to @user, notice: "You purchase of #{@outline.title} by #{@outline.seller.name}. is complete" }
#       format.json { render :show, status: :created, location: @user }
#     else
#       format.html { render :new }
#       format.json { render json: @user.errors, status: :unprocessable_entity }
#     end
#   end
#
#   def destroy
#   end
#
#   private
#
#   def purchase_params
#       params.permit(:outline_id, :seller_id)
#   end
# end
