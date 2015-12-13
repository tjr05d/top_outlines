class PurchasesController < ApplicationController
  def new
    @outline = Outline.find(params[:outline_id])
  end

  def create
  end

  def destroy
  end
end
