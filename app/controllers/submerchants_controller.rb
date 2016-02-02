class SubmerchantsController < ApplicationController
  # before_action :set_submerchant, only: [:show, :edit, :update, :destroy]

  # GET /submerchants
  # GET /submerchants.json
  # def index
  #   @submerchants = Submerchant.all
  # end

  # GET /submerchants/1
  # GET /submerchants/1.json
  # def show
  # end

  # GET /submerchants/new
  def new
    # @submerchant = Submerchant.new
  end

  # GET /submerchants/1/edit
  def edit
  end

  # POST /submerchants
  # POST /submerchants.json
  def create
    @user = current_user
    @submerchant = Braintree::MerchantAccount.create(submerchant_params)

    if @submerchant.success?
      redirect_to outlines_path, notice: "Submerchant Sent!"
    else
      flash[:alert] = "#{@submerchant.errors}Something went wrong while processing your transaction. Please try again!"
      render :new
    end
  end

  # PATCH/PUT /submerchants/1
  # PATCH/PUT /submerchants/1.json
  def update
    respond_to do |format|
      if @submerchant.update(submerchant_params)
        format.html { redirect_to @submerchant, notice: 'Submerchant was successfully updated.' }
        format.json { render :show, status: :ok, location: @submerchant }
      else
        format.html { render :edit }
        format.json { render json: @submerchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submerchants/1
  # DELETE /submerchants/1.json
  def destroy
    @submerchant.destroy
    respond_to do |format|
      format.html { redirect_to submerchants_url, notice: 'Submerchant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_submerchant
    #   @submerchant = Submerchant.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submerchant_params
      {
      :individual => {
        :first_name => @user.first_name,
        :last_name => @user.last_name,
        :email => @user.email,
        :phone => params[:phone],
        :date_of_birth => params[:date_of_birth],
        :ssn => params[:ssn],
        :address => {
          :street_address => params[:street_address],
          :locality => params[:locality],
          :region => params[:region],
          :postal_code => params[:postal_code]
        }
      },
      :funding => {
        :descriptor => "New Seller",
        :destination => Braintree::MerchantAccount::FundingDestination::Bank,
        :account_number => "1123581321",
        :routing_number => "071101307"
      },
      :tos_accepted => true,
      :master_merchant_account_id => "topoutlines",
      :id => "new_seller"
    }
    end
end
