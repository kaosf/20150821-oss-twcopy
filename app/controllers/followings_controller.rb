class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find params[:following][:to_user_id]
    following = current_user.followings.build to_user: user
    if following.save
      redirect_to friends_url, flash: {success: 'Followed'}
    else
      redirect_to friends_url, flash: {danger: 'Failed to follow'}
    end
  end

  def destroy
    following = current_user.followings.where(to_user_id: params[:id]).destroy_all
    redirect_to friends_url, flash: {success: 'Unfollowed'}
  end
end
