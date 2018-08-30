class ReviewsController < ApplicationController
  before_action :set_reviewable
  after_action :authorize_review

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.reviewable = @reviewable
    @review.user = current_user
    if @review.save
      redirect_to bookings_path
    else
      render :new, reviewable: @reviewable.class.to_s.downcase, reviewable_id: @reviewable.id
    end
  end

  private

  def authorize_review
    authorize @review
  end

  def set_reviewable
    @reviewable = params[:reviewable].singularize.capitalize.constantize.find(params[:reviewable_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end

end
