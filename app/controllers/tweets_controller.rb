class TweetsController < ApplicationController
  def index
	@tweets = Tweet.all
  end

  def new; end

  def create
  	@tweet = Tweet.new(tweet_params)
  	binding.pry
  	@tweet.save
  	redirect_to root_path
  	
  end

  private
  def tweet_params
  	params.permit(:name, :image, :text)
  end
end
