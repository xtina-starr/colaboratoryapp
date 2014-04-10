class YoutubeProvider

  def initialize
    @key = ENV['GOOGLE_API_KEYS']
  end

  def get_channels_for_user(user_token)
    channel = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=id&mine=true&access_token=#{user_token}")
    @playlist_id = channel['items'].first['id']
  end

  # get upload playlist from channel
  def get_uploads_playlist(channel_id)
    playlists = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=id%2C+contentDetails&id=#{@channel_id}&key=@key")
    @playlist_id = playlists['items'].first['contentDetails']['relatedPlaylists']['uploads']
  end

  # fetch videos from a playlist
  def get_playlist_items(playlist_id)
    playlist = HTTParty.get("https://www.googleapis.com/youtube/v3/playlistItems?part=id%2CcontentDetails&playlistId=#{channel_id}&key=@key")

    video_ids = []
    playlist['items'].each do |item|
      video_ids << item["contentDetails"]["videoId"]
    end

    video_ids
  end

  def get_videos_for(user_token)
    channel_id = get_channels_for_user(user_token)
    playlist_id = get_uploads_playlist(channel_id)

    get_playlist_items(playlist_id)
  end

  def self.get_client
    # HTTParty.get('https://www.googleapis.com/youtube/v3/videos?part=id&id=UCiK6WR3r4PAG7SvAO3AeVvg&key=@key')
  end

end


youtube_client = YoutubeProvider.new

youtube_client.get_channels_for_user(123456..)