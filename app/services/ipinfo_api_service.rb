class IpinfoApiService
  attr_reader :url
  def initialize(ip)
    @url = "https://ipinfo.io/#{ip}/geo"
  end

  def fetch_ip_info
    @response = RestClient.get url
    JSON.parse(@response)
  end
end