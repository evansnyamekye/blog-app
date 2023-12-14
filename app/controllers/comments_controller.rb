class CommentsController < ApplicationController
  def new
    store_referer
    @comment = Comment.new
  end

  def create
    @comment = @current_user.comments.create(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to user_post(@current_user, params[:post.id])
    else
      flash.now[:error] = 'Error: Comment could not be saved'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def store_referer
    session[:referer] = request.referer
  end

  def redirect_back_or_default(default)
    redirect_to(session[:referer] || default)
    session.delete(:referer)
  end
end
