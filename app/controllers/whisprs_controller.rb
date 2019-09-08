class WhisprsController < ApplicationController
  before_action :set_whispr, only: [:show, :edit, :update, :destroy, :vote, :profile]
  before_action :authenticate_user!, except: [:index, :show, :vote]

  # GET /whisprs
  # GET /whisprs.json
  def index
    @users = User.all.order("created_at DESC")
    if user_signed_in?
      following_list = current_user.following
      following_list << current_user unless following_list.include? current_user
      @whisprs = Whispr.includes(:comments).of_followed_users(following_list).order("created_at DESC")
    else
      @whisprs = Whispr.includes(:comments).all.order("created_at DESC")
    end

    @whispr = Whispr.new
  end

  # GET /whisprs/1
  # GET /whisprs/1.json
  def show
  end

  def profile
    @user = User.find(params[:user_id])
    if user_signed_in?
      @whisprs = Whispr.includes(:comments).where(:user_id => @user.id).order("created_at DESC")
    else
      @whisprs = Whispr.includes(:comments).where(:user_id => @user.id).order("created_at DESC")
    end

    @whispr = Whispr.new

    respond_to do |format|
      format.html { redirect_to root_path }
    end
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
