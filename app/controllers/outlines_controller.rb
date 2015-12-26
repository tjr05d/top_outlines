class OutlinesController < ApplicationController
  before_action :set_outline, only: [:show, :edit, :update, :destroy]

  # GET /outlines
  # GET /outlines.json
  #The query shows only the outlines for the school that the user attends
  def index
    @school_outlines = Outline.where(school_id: current_user.school.id)
    @outlines = Outline.all
    Outline.price_audit 
  end

  # GET /outlines/1
  # GET /outlines/1.json
  def show
    @cart_action = @outline.cart_action current_user.try :id
  end

  def cart_action(current_user_id)
  if $redis.sismember "cart#{current_user_id}", id
    "Remove from"
  else
    "Add to"
  end
end

  # GET /outlines/new
  def new
    @outline = Outline.new
    @courses = Course.all
    @user = current_user
  end

  # GET /outlines/1/edit
  def edit
  end

  # POST /outlines
  # POST /outlines.json
  def create
    @outline = Outline.new(outline_params)
    @courses = Course.all
    @user = current_user

    respond_to do |format|
      if @outline.save
        format.html { redirect_to @user, notice: 'Outline was successfully created.' }
        format.json { render :show, status: :created, location: @outline }
      else
        format.html { render :new }
        format.json { render json: @outline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outlines/1
  # PATCH/PUT /outlines/1.json
  def update
    respond_to do |format|
      if @outline.update(outline_params)
        format.html { redirect_to @outline, notice: 'Outline was successfully updated.' }
        format.json { render :show, status: :ok, location: @outline }
      else
        format.html { render :edit }
        format.json { render json: @outline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outlines/1
  # DELETE /outlines/1.json
  def destroy
    @outline.destroy
    respond_to do |format|
      format.html { redirect_to outlines_url, notice: 'Outline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outline
      @outline = Outline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outline_params
      params.require(:outline).permit(:title, :description, :attachment, :course_id, :user_id, :professor, :school_id)
    end
end
