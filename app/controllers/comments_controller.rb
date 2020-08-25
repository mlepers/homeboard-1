class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    service = Service.find(params[:service_id])
    @comment.service = service
    @comment.user = current_user
    if @comment.save
      redirect_to service_path(service)
    else
      render 'services/show'
    end
    authorize @service
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user, :service)
  end

end