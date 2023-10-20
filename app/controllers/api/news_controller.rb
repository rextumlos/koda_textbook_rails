class Api::NewsController < ApplicationController
  before_action :authenticate_user!
  def index
    news_service = NewsApiService.new
    @categories = news_service.fetch_categories
    @articles = news_service.fetch_articles(params.permit!.slice(:category))

    ipify_service = IpifyApiService.new
    @user_ip = ipify_service.fetch_user_ip

    ipinfo_service = IpinfoApiService.new(@user_ip)
    @user_ip_info = ipinfo_service.fetch_ip_info

    @catfact = Catfact.new
    @catfacts = Catfact.includes(:user).all.order(created_at: :desc)

    if params[:filter] == '1'
      @catfacts = @catfacts.where(user: current_user)
    end

    random_user_service = RandomUserService.new
    @random_user = random_user_service.fetch_random_user
    p @random_user
  end
end
