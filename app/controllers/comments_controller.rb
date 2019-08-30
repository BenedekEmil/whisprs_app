class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @whispr = Whispr.find(params[:whispr_id])
    @comment = @whispr.comments.create(:name => current_user.name, :response => comment_params[:response])
    @comment.user_id = current_user.id if current_user
    @comment.save

    redirect_to root_path
  end

  def destroy
    @whispr = Whispr.find(params[:whispr_id])
    @comment = @whispr.comments.find(params[:id])
    @comment.destroy

    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :response)
  end
end
