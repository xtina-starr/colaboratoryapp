class YoutubeProvider

  def initialize
    @key = ENV['GOOGLE_API_KEYS']
  end

  def get_channels_for_user(user_token)
    channel = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=id&mine=true&access_token=#{user_token}")
    channel['items'].first['id']
  end

  # get upload playlist from channel
  def get_uploads_playlist_items(playlist_id)
    playlists = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=id%2C+contentDetails&id=#{playlist_id}&key=#{@key}")
    @playlist_items = playlists['items'].first['contentDetails']['relatedPlaylists']['uploads']
  end

  # fetch videos from a playlist
  def get_playlist_items(playlist_items)
    playlist = HTTParty.get("https://www.googleapis.com/youtube/v3/playlistItems?part=id%2CcontentDetails&playlistId=#{playlist_items}&key=#{@key}")

    video_ids = []
    playlist['items'].each do |item|
      video_ids << item["contentDetails"]["videoId"]
    end

    video_ids
  end

  def get_videos_for(user_token)
    playlist_id = get_channels_for_user(user_token)
    playlist_items = get_uploads_playlist_items(playlist_id)

    get_playlist_items(playlist_items)
  end

  def self.get_client
    # HTTParty.get('https://www.googleapis.com/youtube/v3/videos?part=id&id=UCiK6WR3r4PAG7SvAO3AeVvg&key=@key')
  end

end
