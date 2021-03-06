class ReviewsController < ApplicationController
    before_action :set_review, only: [:edit, :update, :destroy]
    
    def index
    @reviews = Review.all
    end
    
    def new
    @review = Review.new
    end

    def create
    @review = Review.new(review_params)
    if @review.save
        redirect_to reviews_path
    else
        render :index        
    end
    end

    def edit
    end

    def update
        if @review.update review_params
            redirect_to reviews_path
        else
            render :edit
        end
    end

    def destroy
    @review.destroy
    redirect_to reviews_path
    end

    private
    def review_params
    params.require(:review).permit(:pqr_id, :user_id, :comment, :date, :finished)
    end

    def set_review
        @review = Review.find(params[:id])
    end

end

