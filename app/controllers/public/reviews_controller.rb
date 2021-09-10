class Public::ReviewsController < ApplicationController
  def create
    review = Review.new(review_params)
    if review.save
    redirect_to shop_path(review.shop.id)
  else
    render "public/shops/show"
  end
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:shop_id,:customer_id,:rate,:content)
  end
end
