class EpicenterController < ApplicationController
  def feed
    # Here we initialize the array that will
    # hold tweets from the current_user's
    # following list.
  	@following_tweets = []

    # Then we look through all the tweets
    # to find the ones associated with
    # users from the current_user's 
    # following array.
  	Tweet.all.each do |tweet|
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

    @tweet = Tweet.new
  end

  def show_user
  	@user = User.find(params[:id])

    @followercount = 0
    User.all.each do |u|
      if u.following.include?(@user.id)
        @followercount += 1
      end
    end
  end

  def now_following
  	current_user.following.push(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(id: params[:id])
  end

  def unfollow
  	current_user.following.delete(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(id: params[:id])
  end

  def followers
    @user = User.find(params[:id])
    @users = []
    User.all.each do |u|
      if u.following.include?(@user.id)
        @users.push(u)
      end
    end
  end

  def following
    @user = User.find(params[:id])
    @users = []
    User.all.each do |u|
      if @user.following.include?(u.id)
        @users.push(u)
      end
    end
  end
end
