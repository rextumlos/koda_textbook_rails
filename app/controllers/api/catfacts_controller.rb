class Api::CatfactsController < ApplicationController
  before_action :authenticate_user!

  def create
    @catfact = Catfact.new
    @catfact.user = current_user
    catfact_url = 'https://catfact.ninja/fact'
    @response = RestClient.get catfact_url
    fact = JSON.parse(@response)['fact']

    @catfact.fact = fact

    if @catfact.save
      flash[:notice] = 'Catfact created successfully'
      redirect_to api_news_index_path
    else
      flash.now[:alert] = 'Catfact create failed'
      redirect_to api_news_index_path, status: :unprocessable_entity
    end
  end
end
