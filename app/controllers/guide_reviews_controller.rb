class GuideReviewsController < ApplicationController

  def index
    @guide_reviews = GuideReview.all
  end

  def show
    @guide_review = GuideReview.find_by_id(params[:id])
  end

end