class User::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts.includes(:categories, :user, :region, :province, :city, :barangay)
    @posts = @posts.order(created_at: :desc)
    @posts = @posts.page(params[:page]).per(5)
  end
end
