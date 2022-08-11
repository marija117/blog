class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_post

  def index
  end

  def show
  end

  def new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_path(@post), notice: 'Book was successfully created.'
    else
      render json: { errors: @comment.errors }, status: 422 
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def get_post
    @post = Post.find(params[:post_id]) if params[:post_id]
  end

  def comment_params
    params.require(:comment).permit(:post_id, :body, :user_id)
  end
end
