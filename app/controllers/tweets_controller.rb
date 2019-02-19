class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :set_params, only: [:destroy, :edit, :update]
  def index
	@tweets = Tweet.includes(:user).order('created_at DESC').page(params[:page]).per(5)
  end

  def new; end

  def create
  	@tweet = Tweet.new(tweet_params)
  	@tweet.save
  	redirect_to root_path
  	
  end

  def destroy
    @tweet.destroy if @tweet.user_id == current_user.id
    redirect_to root_path
  end

  def edit; end

  def update
    @tweet.update(tweet_params) if @tweet.user_id == current_user.id
    binding.pry
    redirect_to root_path
  end

  private
  def tweet_params
  	params.permit(:image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
  	redirect_to tweets_path unless user_signed_in?
  end

  def set_params
    @tweet = Tweet.find(params[:id])
  end
end
