class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :is_owner?, only: [:edit, :update, :destroy]

  def index
    @comments = @post.comments
  end

  def show
  end

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to user_post_path(@post.user, @post), notice: 'Comment was successfully created.'
    else
      render json: { errors: @comment.errors }, status: 422 
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to user_post_comments_path(@post.user, @post), notice: 'Comment was successfully updated.'
    else
      render json: { errors: @comment.errors }, status: 422 
    end
  end

  def edit
  end

  def destroy
    @comment.destroy

    redirect_to user_post_comments_path(@post.user, @post)
  end

  private

  def get_post
    @post = Post.find(params[:post_id]) if params[:post_id]
  end

  def set_comment
    @comment = @post.comments.find(params[:id]) if params[:id]
  end

  def is_owner?
    redirect_to root_path unless @comment.user.id == current_user.id
  end

  def comment_params
    params.require(:comment).permit(:post_id, :body, :user_id)
  end
end
