class YoutubeProvider
  
  def initialize
    @key = ENV['GOOGLE_API_KEYS']
  end

  def refresh_token(provider)

    response = HTTParty.post('https://accounts.google.com/o/oauth2/token', 
      :body => { 
        :grant_type => 'refresh_token', 
        :refresh_token => provider.refresh_token, 
        :client_id => ENV['GOOGLE_CLIENT_ID'], 
        :client_secret => ENV['GOOGLE_SECRET']}
    )
    refreshhash = JSON.parse(response.body)
    provider.token = refreshhash['access_token']
    provider.expiresat = DateTime.now + refreshhash["expires_in"].to_i.seconds
    provider.save!
    provider.token

  end

  def token_expired?(provider)
      if provider.expiresat 
        expiry = Time.at(provider.expiresat)
      else
        expiry = Time.now + 2.days
      end 
        return true if expiry < Time.now ## expired token, so we should quickly return
        provider.expiresat = expiry
        provider.save if provider.changed?
        false # token not expired. :D
  end

  def get_channels_for_user(user_token)
    provider = Provider.find_by(token: user_token)
    if token_expired?(provider)
      user_token = refresh_token(provider)
    end

    channel = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=id&mine=true&access_token=#{user_token}&key=#{@key}")
    channel['items'].first['id']
  end

  # get upload playlist from channel
  def get_uploads_playlist_items(playlist_id)
    playlists = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=id%2C+contentDetails&id=#{playlist_id}&key=#{@key}")
    @playlist_items = playlists['items'].first['contentDetails']['relatedPlaylists']['uploads']
  end

  # fetch videos from a playlist
  def get_playlist_items(playlist_items)
    playlist = HTTParty.get("https://www.googleapis.com/youtube/v3/playlistItems?part=id%2Csnippet%2CcontentDetails&playlistId=#{playlist_items}&key=#{@key}")

    video_hash = []
    playlist['items'].each do |item|

      video_hash << { "title" => item["snippet"]["title"],
      "video_id" => item["contentDetails"]["videoId"] }
    end

    video_hash
  end

  def get_videos_for(user_token)
    playlist_id = get_channels_for_user(user_token)
    playlist_items = get_uploads_playlist_items(playlist_id)

    get_playlist_items(playlist_items)
  end

end
