class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all.order("created_at DESC")
    @user = Whispr.new
  end

  def show

  end

  def new

  end



  private

  def set_whispr
    @whispr = Whispr.find(params[:id])
  end
end
