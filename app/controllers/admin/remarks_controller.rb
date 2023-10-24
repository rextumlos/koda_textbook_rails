class RemarksController < ApplicationController
  before_action :set_remark, only: [:edit, :update, :destroy]
  before_action :check_admin

  def index
    @remarks = Remark.all
  end

  def new
    @remark = Remark.new
  end

  def create
    @remark = Remark.new(remark_params)

    if @remark.save
      flash[:notice] = 'Remark created successfully'
      redirect_to remarks_path
    else
      flash[:alert] = 'Remark creation failed'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @remark.update(remark_params)
      flash[:notice] = 'Remark updated successfully'
      redirect_to remarks_path
    else
      flash[:alert] = 'Remark update failed'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @remark.destroy
    flash[:notice] = 'Remark destroyed successfully'
    redirect_to remarks_path
  end

  private

  def set_remark
    @remark = Remark.find(params[:id])
  end

  def remark_params
    params.require(:remark).permit(:name)
  end

  def check_admin
    raise ActionController::RoutingError.new('Not Found') unless current_user.admin?
  end
end
