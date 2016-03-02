class EpicenterController < ApplicationController

  def feed


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

  def tag_tweets
    @tag = Tag.find(params[:id])
  end
end
