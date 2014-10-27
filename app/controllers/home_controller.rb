class HomeController < ApplicationController

    before_action do
    if session[:user_id].present?
    else
      redirect_to sign_in_path
    end
  end

  def index
    if params[:unfollow_user_id]
      @followings = Following.where(user_id: params[:unfollow_user_id], follower_id: current_user.id )
      @followings.first.destroy
      redirect_to root_path, :flash => { :info => "The user was successfully unfollowed" }
    end
    @users = User.all
    @posts = current_user.posts.order("created_at desc")
    @post = Post.new
    @followings = User.following(@current_user.id).page(params[:page]).per(3)

  end

  def new_post
    @new_post = Post.new(params.require(:post).permit(:message))
    @new_post.user = current_user
    if @new_post.save
      redirect_to root_path
    else
      render :index
    end
  end


end
