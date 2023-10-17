class CatfactApiService
  attr_reader :url

  def initialize
    @url = 'https://catfact.ninja/fact'
  end

  def fetch_catfact
    @response = RestClient.get url
    JSON.parse(@response)['fact']
  end
end