require 'rest-client'

class songs_id 

  def search name1
    url =  "https://api.spotify.com/v1/artists/#{name1}/top-tracks?country=us"
    response = RestClient::Request.execute( method: :get, url: url)
    Rails.logger.info "Search Result for name #{name1} #{response}"
    response = JSON.parse response
  end
end
