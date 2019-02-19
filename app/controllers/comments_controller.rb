class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to "tweets/#{@comment.tweet.id}"
  end

  private
  def comment_params
  	params.require(:comment, :tweet_id).permit(:text).merge(user_id: current_user.id)
  end
end
