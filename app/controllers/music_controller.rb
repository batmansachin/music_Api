class MusicController < ApplicationController
  def index
  end

  def show
  end

  def update
  end

  def search
  	song_name = params["message"]
  	sportyfy_service = ::SportyfyService.new()
  	@artist_detail = sportyfy_service.search(song_name)
    artist_id = @artist_detail["id"]
    
    #Song_info = ::songs_id.new()
    @track_list = sportyfy_service.get_top_tracks(artist_id)
  end
end
