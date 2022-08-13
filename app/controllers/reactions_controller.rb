class ReactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_comment
  before_action :set_reaction, only: [:destroy]
  before_action :is_owner?, only: [:destroy]

  def new
    @reaction = @comment.reactions.build
  end

  def create
    @reaction = @comment.reactions.build(reaction_params)
    @reaction.user_id = current_user.id

    if @reaction.save
      redirect_to user_post_comment_path(@comment.post.user, @comment.post, @comment), notice: 'Reaction was successfully created.'
    else
      render json: { errors: @reaction.errors }, status: 422 
    end
  end

  def destroy
    @reaction.destroy

    redirect_to user_post_comment_path(@comment.post.user, @comment.post, @comment)
  end

  private

  def get_comment
    @comment = Comment.find(params[:comment_id]) if params[:comment_id]
  end

  def set_reaction
    @reaction = @comment.reactions.find(params[:id]) if params[:id]
  end

  def is_owner?
    redirect_to root_path unless @reaction.user.id == current_user.id
  end

  def reaction_params
    params.require(:reaction).permit(:comment_id, :category, :user_id)
  end
end
