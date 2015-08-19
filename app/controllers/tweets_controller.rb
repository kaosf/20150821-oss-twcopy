class TweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = current_user.tweets.build body: params[:tweet][:body]
    if tweet.save
      redirect_to root_url, flash: {success: 'Tweeted.'}
    else
      redirect_to root_url, flash: {danger: tweet.errors}
    end
  end
end
