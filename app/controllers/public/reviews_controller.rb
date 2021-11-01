# frozen_string_literal: true

module Public
  class ReviewsController < ApplicationController
    def create
      review = Review.new(review_params)
      if review.save
        redirect_to shop_path(review.shop.id), notice: '口コミを投稿しました。'
      else
        redirect_to shop_path(review.shop.id), alert: '星の評価は必須です。'
      end
    end

    def destroy
      review = Review.find(params[:id])
      if review.customer_id == current_customer.id
        review.destroy
        redirect_to shop_path(review.shop.id), notice: '口コミを削除しました。'
      else
        redirect_to root_path, alert: '権限がありません。'
      end
    end

    def show
      if customer_signed_in?
        @review = Review.find(params[:id])
      elsif shop_signed_in?
        @review = Review.find(params[:id])
      else
        redirect_to root_path
      end
    end

    private

    def review_params
      params.require(:review).permit(:shop_id, :customer_id, :rate, :content)
    end
  end
end
