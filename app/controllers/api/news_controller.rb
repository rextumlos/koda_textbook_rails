class Api::NewsController < ApplicationController
  def index
    @categories = %w[business entertainment general health science sports technology]
    api_params = {
      'apiKey': ENV['NEWS_API_KEY'],
      country: 'ph'
    }

    if params[:category].present?
      api_params['category'] = params[:category]
    end

    url = 'https://newsapi.org/v2/top-headlines'
    @response = RestClient.get url, params: api_params
    @articles = JSON.parse(@response)['articles']

    ipify_url = 'https://api.ipify.org/?format=json'
    @ipify_response = RestClient.get ipify_url
    @user_ip = JSON.parse(@ipify_response)['ip']
  end
end
