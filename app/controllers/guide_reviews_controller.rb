class GuideReviewsController < ApplicationController

  def index
    @guide_reviews = GuideReview.all
  end

  def show
    @guide_review = GuideReview.find_by_id(params[:id])
  end

  def create
    @guide_reviews = GuideReview.new(guide_review_params)

    if @guide_reviews.save
      render :index, status: :created, location: guide_review_url(@guide_reviews)
    else
      head :unprocessable_entity
    end
  end

  def update
    @guide_reviews = GuideReview.find params[:id]

    if @guide_reviews
      if @guide_reviews.update_attributes(guide_review_params)
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    @guide_reviews = GuideReview.find params[:id]

    if @guide_reviews
      if @guide_reviews.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

end