class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(parrams[:id])
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
      flash[:success] = 'Your post has been created.'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Your new post has not been created. Please try again.'
      render :new
    end
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post updated.'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Update failed. Please try again.'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
