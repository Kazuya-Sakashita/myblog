class CommentsController < ApplicationController
  def create
    @post = Post.find_by(id: params[:id])
    @post.comments.create(comment_params)
    redirect_to show_path(@post)
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @comment = @post.comments.find(params[:comment_id])
    @comment.destroy
    redirect_to show_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end

end
