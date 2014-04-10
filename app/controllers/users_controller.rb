class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])

    if @user.providers.where(provider_type: "vimeo").first
      @clientv = Vimeo::Advanced::Video.new(ENV["VIMEO_KEY"], ENV["VIMEO_SECRET"],
        :token => current_user.providers.find_by(provider_type: "vimeo").token,
        :secret => current_user.providers.find_by(provider_type: "vimeo").secret)
      @videos = @clientv.get_all("colaboratory")
    end

    if @user.providers.where(provider_type: "soundcloud").first
      @client = SoundcloudProvider.get_client(@user)
      @tracks = @client.get('/me/tracks')
    end

    if user_token = @user.providers.where(provider_type: "google_oauth2").first.token

      @youtubes = YoutubeProvider.new.get_videos_for(user_token)
    end
  end

  def update
  end
end
