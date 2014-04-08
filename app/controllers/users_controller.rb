class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])

    case
    when @user.providers.where(provider_type: "vimeo").first
      @clientv = Vimeo::Advanced::Video.new(ENV["VIMEO_KEY"], ENV["VIMEO_SECRET"],
        :token => current_user.providers.find_by(provider_type: "vimeo").token,
        :secret => current_user.providers.find_by(provider_type: "vimeo").secret)
      @videos = @clientv.get_all("colaboratory")

    when @user.providers.where(provider_type: "soundcloud").first
      @client = SoundcloudProvider.get_client(@user)
      @tracks = @client.get('/me/tracks')
    end
  end

  def update
  end
end
