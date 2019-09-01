class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :vote]
  def create
    @whispr = Whispr.find(params[:whispr_id])
    @comment = @whispr.comments.create(:name => current_user.name, :response => comment_params[:response])
    @comment.user_id = current_user.id if current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to whispr_path(@whispr)}
        format.js
      else
        format.html { redirect_to whispr_path(@whispr), notice: "Reply did not save. Please try again."}
        format.js { render 'comments/create', content_type: 'text/javascript' }
      end
    end
  end

  def new
  end

  def destroy
    @whispr = Whispr.find(params[:whispr_id])
    @comment = @whispr.comments.find(params[:id])
    @comment.destroy

    redirect_to root_path
  end

  def vote
    @whispr = Whispr.find(params[:whispr_id])
    @comment = @whispr.comments.find(params[:id])
    if request.put?
      @comment.liked_by current_user
    elsif request.delete?
      @comment.unliked_by current_user
    end
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { render layout:false }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :response)
  end
end
