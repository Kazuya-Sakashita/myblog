class CommentsController < ApplicationController
  def create
    @post = Post.find_by(id: params[:id])
    @post.comments.create(comment_params)
    redirect_to root_path
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

end
