class RookieReviewsController < ApplicationController

  def index
    @rookie_reviews = RookieReview.all
  end

  def show
    @rookie_review = RookieReview.find_by_id(params[:id])
  end

end