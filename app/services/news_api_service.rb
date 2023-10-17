class NewsApiService
  attr_reader :url

  def initialize
    @url = 'https://newsapi.org/v2/top-headlines'
  end

  def fetch_articles(params={})
    api_params = {
      'apiKey': ENV['NEWS_API_KEY'],
      country: 'ph'
    }

    response = RestClient.get url, params: api_params.merge(params)
    JSON.parse(response)['articles']
  end

  def fetch_categories
    %w[business entertainment general health science sports technology]
  end
end