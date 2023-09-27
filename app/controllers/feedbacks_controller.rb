class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params.require(:feedback).permit(:email, :message))
    if @feedback.save
      flash[:notice] = 'Post created successfully'
      redirect_to root_path
    else
      flash.now[:alert] = 'Post create failed'
      render :new, status: :unprocessable_entity
    end
  end
end
