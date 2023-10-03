class FeedbacksController < ApplicationController

  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  before_action :set_remarks, only: [:index, :new, :edit]

  def index
    @feedbacks = Feedback.all
    if params[:search].present?
      @feedbacks = @feedbacks.where('email LIKE :search OR message LIKE :search', search: "%#{params[:search]}%")
    end

    if params[:start_date].present? and params[:end_date].present?
      start_date = params[:start_date]
      end_date = params[:end_date].to_date.end_of_day
      @feedbacks = @feedbacks.where(created_at: start_date..end_date)
    end

    if params[:sort].present?
      @feedbacks = @feedbacks.order(email: :asc) if params[:sort] == "email"
      @feedbacks = @feedbacks.order(id: :asc) if params[:sort] == "id"
      @feedbacks = @feedbacks.order(created_at: :desc) if params[:sort] == "created_at"
    end

    if params[:remark].present?
      @feedbacks = @feedbacks.where(remark: params[:remark])
    end
  end

  def show;
    @notes = @feedback.notes.all
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      flash[:notice] = 'Post created successfully'
      redirect_to feedbacks_path
    else
      flash.now[:alert] = 'Post create failed'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @feedback.update(feedback_params)
      flash[:notice] = 'Feedback updated successfully'
      redirect_to feedbacks_path
    else
      flash.now[:alert] = 'Feedback update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @feedback.destroy
    flash[:notice] = 'Feedback destroyed successfully'
    redirect_to feedbacks_path
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def set_remarks
    # Need to map remarks where key is humanize and value is key because "0" and "1" which should be 0, 1 are invalid remarks.
    @remarks = Feedback.remarks.map {|key, value| [key.humanize, key]}
  end

  def feedback_params
    params.require(:feedback).permit(:email, :message, :remark)
  end
end
