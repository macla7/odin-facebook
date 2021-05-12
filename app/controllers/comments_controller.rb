class CommentsController < ApplicationController
  before_action :find_post
  before_action :authenticate_user!

  def create
    @post.comments.create(user_id: current_user.id, content: params[:content])
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
