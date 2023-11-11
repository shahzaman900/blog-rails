class PostsController < ApplicationController
  # load_and_authorize_resourcecls

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)

    render json: @posts, except: %i[created_at updated_at]
  end

end