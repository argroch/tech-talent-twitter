class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!, :new_tweet, :followercount

  before_action :configure_permitted_parameters, if: :devise_controller?

  def new_tweet
    @tweet = Tweet.new
  end

  def followercount
    # Here we initialize the array that will
    # hold tweets from the current_user's
    # following list.
    @following_tweets = []

    # Then we look through all the tweets
    # to find the ones associated with
    # users from the current_user's 
    # following array.
    Tweet.order(created_at: :desc).each do |tweet|
      if current_user.following.include?(tweet.user_id) || tweet.user_id == current_user.id
        @following_tweets.push(tweet)
        # And those tweets are pushed into
        # the @following_tweets array
        # which will power the view
      end
    end

    @followercount = 0
    User.all.each do |u|
      if u.following.include?(current_user.id)
        @followercount += 1
      end
    end
  end

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :name, :username, :bio, :location, :following, :avatar) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :name, :username, :bio, :location, :following, :avatar) }

  end
end
