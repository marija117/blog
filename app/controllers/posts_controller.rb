class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :is_owner?, only: [:edit, :update, :destroy]

  def index
    @posts = @user.posts
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)


    if @post.save
      redirect_to user_posts_path(@user), notice: 'Post was successfully created.'
    else
      render json: { errors: @post.errors }, status: 422 
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to user_posts_path(@user), notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to user_posts_path(@user), status: :see_other
  end

  private

  def get_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def set_post
    @post = Post.find(params[:id]) if params[:id]
  end

  def is_owner?
    redirect_to root_path unless @post.user.id == current_user.id
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
