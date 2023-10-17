class Api::NewsController < ApplicationController
  before_action :authenticate_user!
  def index
    news_service = NewsApiService.new
    @categories = news_service.fetch_categories
    @articles = news_service.fetch_articles(params.permit!.slice(:category))

    ipify_service = IpifyApiService.new
    @user_ip = ipify_service.fetch_user_ip

    @catfact = Catfact.new
    @catfacts = Catfact.includes(:user).all.order(created_at: :desc)

    if params[:filter] == '1'
      @catfacts = @catfacts.where(user: current_user)
    end
  end
end
