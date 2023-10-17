class IpifyApiService
  attr_reader :url

  def initialize
    @url = 'https://api.ipify.org/?format=json'
  end

  def fetch_user_ip
    response = RestClient.get url
    JSON.parse(response)['ip']
  end
end