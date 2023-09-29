class FeedbacksController < ApplicationController

  before_action :set_feedback, only: [:show, :edit, :update]

  def index
    @feedbacks = Feedback.all
  end

  def show; end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(post_params)
    if @feedback.save
      flash[:notice] = 'Post created successfully'
      redirect_to root_path
    else
      flash.now[:alert] = 'Post create failed'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @feedback.update(post_params)
      flash[:notice] = 'Feedback updated successfully'
      redirect_to feedbacks_path
    else
      flash.now[:alert] = 'Feedback update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def post_params
    params.require(:feedback).permit(:email, :message)
  end
end
