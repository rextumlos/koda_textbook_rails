class Api::CatfactsController < ApplicationController
  before_action :authenticate_user!

  def create
    catfact_service = CatfactApiService.new
    @catfact = Catfact.new
    @catfact.user = current_user
    @catfact.fact = catfact_service.fetch_catfact

    if @catfact.save
      flash[:notice] = 'Catfact created successfully'
      redirect_to api_news_index_path
    else
      flash.now[:alert] = 'Catfact create failed'
      redirect_to api_news_index_path, status: :unprocessable_entity
    end
  end
end
