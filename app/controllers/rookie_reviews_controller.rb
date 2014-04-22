class RookieReviewsController < ApplicationController

  def index
    @rookie_reviews = RookieReview.all
  end

  def show
    @rookie_review = RookieReview.find_by_id(params[:id])
  end

  def create
    @rookie_reviews = RookieReview.new(rookie_review_params)

    if @rookie_reviews.save
      render :index, status: :created, location: rookie_review_url(@rookie_reviews)
    else
      head :unprocessable_entity
    end
  end

  def update
    @rookie_reviews = RookieReview.find params[:id]

    if @rookie_reviews
      if @rookie_reviews.update_attributes(rookie_review_params)
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    @rookie_reviews = RookieReview.find params[:id]

    if @rookie_reviews
      if @rookie_reviews.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

end