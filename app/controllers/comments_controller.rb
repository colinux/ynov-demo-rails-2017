class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @new_comment = Comment.new(comment_params)
    @new_comment.restaurant = @restaurant
    @new_comment.user = current_user

    if @new_comment.valid?
      @new_comment.save!
      redirect_to restaurant_path(@restaurant)
    else
      render "restaurants/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
