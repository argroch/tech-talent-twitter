module ApplicationHelper

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
  
end
