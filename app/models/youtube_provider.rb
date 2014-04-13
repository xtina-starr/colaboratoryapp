class YoutubeProvider

  def initialize
    @key = ENV['GOOGLE_API_KEYS']
  end

  def refresh_token_if_expired(provider)
        if token_expired?(provider)
            user_token = Provider.find_by(token: user_token)
            # response = RestClient.post "#{ENV['DOMAIN']}oauth2/token", :grant_type => 'refresh_token', :refresh_token => self.refresh_token, :client_id => ENV['APP_ID'], :client_secret => ENV['APP_SECRET'] 
            response = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=id&mine=true&access_token=#{user_token}&key=#{@key}")
            # ('https://accounts.google.com/o/oauth2/auth', :grant_type => 'refresh_token', :refresh_token => provider.token, :client_id => ENV['GOOGLE_CLIENT_ID'], :client_secret => ENV['GOOGLE_SECRET'])
            refreshhash = JSON.parse(response.body)
        
            self.token = refreshhash['access_token']
            self.expiresat = DateTime.now + refreshhash["expires_in"].to_i.seconds
            self.save

        end

  end

  def token_expired?(provider)
      if provider.expiresat
        expiry = Time.at(provider.expiresat)
      else
        expiry = Time.now + 2.hours
      end 
        return true if expiry < Time.now ## expired token, so we should quickly return
        provider.expiresat = expiry
        provider.save if provider.changed?
        false # token not expired. :D
  end

  def get_channels_for_user(user_token)
    # user = Provider.find_by(token: user_token)
    #refresh_token_if_expired(Provider.find_by(token: user_token))

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
    playlist = HTTParty.get("https://www.googleapis.com/youtube/v3/playlistItems?part=id%2CcontentDetails&playlistId=#{playlist_items}&key=#{@key}")

    video_ids = []
    playlist['items'].each do |item|
      video_ids << item["contentDetails"]["videoId"]
    end

    @youtubes = video_ids
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
