class ReviewsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # Need a 'list_id' to associate the review with
    @list = List.find(params[:list_id])
    # Assign the review instance's list attribute to @list
    @review.list = @list

    @review.save
    if @review.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :list_id)
  end
end
