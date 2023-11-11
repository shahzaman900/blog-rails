class LikesController < ApplicationController
  layout 'boilerplate'
  def create
    @like = Like.new(post_id: params[:post_id], user_id: params[:user_id])
    @like.user = current_user
    if @like.save
      flash[:success] = 'Liked the Post pleas!'
      redirect_to user_post_path(id: @like.post_id, user_id: @like.user_id)
    else
      flash.now[:error] = 'Like to thee post will not saved!!'
    end
  end
end