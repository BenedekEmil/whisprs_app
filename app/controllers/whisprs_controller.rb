class WhisprsController < ApplicationController
  before_action :set_whispr, only: [:show, :edit, :update, :destroy, :vote]
  before_action :authenticate_user!, except: [:index, :show, :vote]

  # GET /whisprs
  # GET /whisprs.json
  def index
    @whisprs = Whispr.all.order("created_at DESC")
    @whispr = Whispr.new
  end

  # GET /whisprs/1
  # GET /whisprs/1.json
  def show
  end

  # GET /whisprs/new
  def new
    @whispr = current_user.whisprs.build
  end

  # GET /whisprs/1/edit
  def edit
  end

  # POST /whisprs
  # POST /whisprs.json
  def create
    @whispr = current_user.whisprs.build(whispr_params)
    respond_to do |format|
      if @whispr.save
        format.html { redirect_to root_path, notice: 'Whispr was successfully created.' }
        format.json { render :show, status: :created, location: @whispr }
      else
        format.html { render :new }
        format.json { render json: @whispr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /whisprs/1
  # PATCH/PUT /whisprs/1.json
  def update
    respond_to do |format|
      if @whispr.update(whispr_params)
        format.html { redirect_to root_path, notice: 'Whispr was successfully updated.' }
        format.json { render :show, status: :ok, location: @whispr }
      else
        format.html { render :edit }
        format.json { render json: @whispr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whisprs/1
  # DELETE /whisprs/1.json
  def destroy
    @whispr.destroy
    respond_to do |format|
      format.html { redirect_to whisprs_url, notice: 'Whispr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote
    if request.put?
      @whispr.liked_by current_user
    elsif request.delete?
      @whispr.unliked_by current_user
    end
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { render layout:false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whispr
      @whispr = Whispr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def whispr_params
      params.require(:whispr).permit(:title, :description, :user_id, :whispr_files)
    end
end
