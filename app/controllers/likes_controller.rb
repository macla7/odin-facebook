class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.your_likes.create(user_id: current_user.id, postee_id: @post.user.id)
    end
    redirect_to post_path(@post)
  end

  def destroy
    p 'hey look at me'
    p params
    p params[:id]
    p 'bye'
    if !already_liked?
      flash[:notice] = "You haven't liked it."
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  def find_like
    @like = @post.your_likes.find(params[:id])
  end
end
