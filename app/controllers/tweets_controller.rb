class TweetsController < ApplicationController
  before_action :move_to_index except: [:index]
  def index
	@tweets = Tweet.order('created_at DESC').page(params[:page]).per(5)
  end

  def new; end

  def create
  	@tweet = Tweet.new(tweet_params)
  	@tweet.save
  	redirect_to root_path
  	
  end

  private
  def tweet_params
  	params.permit(:name, :image, :text)
  end

  def move_to_index
  	redirect_to tweets_path unless user_signed_in?
  end
end
