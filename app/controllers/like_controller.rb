class LikesController < ApplicationController
  layout 'boilerplate'
  def create
    @like = Like.new(post_id: params[:post_id], user_id: params[:user_id])
    @like.user = current_user
    if @like.save
      flash[:success] = 'Liked the Post!'
      redirect_to user_post_path(id: @like.post_id, user_id: @like.user_id)
    else
      flash.now[:error] = 'Like to the Post could not be saved!'
    end
  end
end