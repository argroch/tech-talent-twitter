module TweetsHelper
	def get_tagged tweet
		message_arr = tweet.message.split
    message_arr.each_with_index do |word, index|
      if word[0] == "#"
        if Tag.pluck(:topic).include?(word)
          tag = Tag.find_by(topic: word)
        else
          tag = Tag.create(topic: word)
        end
        message_arr.delete(word)
        message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
        tweet_tag = TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
      end
    end

    tweet.update(message: message_arr.join(" "))
    return tweet
	end
end
