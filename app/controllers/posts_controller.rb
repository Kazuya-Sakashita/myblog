class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: 'desc')
  end


  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.del_flag = 0

    if @post.save
      redirect_to root_path
    else
      # flash[:alert] = 'Save error!'
      #   render:index
      # render plain: @post.errors.inspect
      render 'new'
    end
  end

    def update
      @post = Post.find_by(id: params[:id])
      if @post.update_attributes(post_params)
        redirect_to root_path
      else
        render:edit

      end

    end

    def delete
      @posts = Post.all.order(created_at: 'desc')
    end

    def destroy
      @post = Post.find_by(id: params[:id])
      # if @post.destroy
      if @post.del_flag == 0
         @post.del_flag = 1
         @post.save
         redirect_to root_path
      else
         render :index
      end
    end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
