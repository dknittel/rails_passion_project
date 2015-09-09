require 'httparty'
require 'json'

class PlayerStatsClient
  include HTTParty
  def get_stats
    uri = URI('http://api.fantasydata.net/nba/v2/JSON/PlayerSeasonStats/2015')
    uri.query = URI.encode_www_form({
      })

    request = Net::HTTP::Get.new(uri.request_uri)
  # Request headers
  puts 'env'
  puts ENV['OCP_APIM_SUBSCRIPTION_KEY']
  request['Ocp-Apim-Subscription-Key'] = ENV['OCP_APIM_SUBSCRIPTION_KEY']
  # Request body
  request.body = "{body}"

  response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    http.request(request)
  end

  return response.body
  end
end

stats = PlayerStatsClient.new
stats.get_stats
