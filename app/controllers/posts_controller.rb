class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post
    else
      render json: { errors: @post.errors }, status: 422 
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:id]) if params[:id]
  end

  def post_params
    params.require(:post).permit(:text)
  end
end
