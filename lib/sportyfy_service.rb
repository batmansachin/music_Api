require 'rest-client'

class SportyfyService
  def search name
    url = "https://api.spotify.com/v1/search?q=#{name}&type=artist"
    #url = "https://api.spotify.com/v1/tracks/{name}"

    url = URI::encode(url)
    response = RestClient::Request.execute( method: :get, url: url)
    Rails.logger.info "Search Result for name #{name} #{response}"
    response = JSON.parse response
    response["artists"]["items"].first
  end

  def get_top_tracks artist_id
    url =  "https://api.spotify.com/v1/artists/#{artist_id}/top-tracks?country=us"
    response = RestClient::Request.execute( method: :get, url: url)
    Rails.logger.info "Search Result for name #{artist_id} #{response}"
    response = JSON.parse response
    response["tracks"]
  end
end