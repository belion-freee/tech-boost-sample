class CommentsController < ApplicationController
  def new
    @comment = Comment.new(topic_id: params[:topic_id])
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to topics_path, success: 'コメントに成功しました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:topic_id, :comment)
  end
end
