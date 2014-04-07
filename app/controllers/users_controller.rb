class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])

    # @client = VimeoProvider.get_client(@user)
    @clientv = Vimeo::Advanced::Video.new(ENV["VIMEO_KEY"], ENV["VIMEO_SECRET"],
      :token => current_user.providers.find_by(provider_type: "vimeo").token,
      :secret => current_user.providers.find_by(provider_type: "vimeo").secret)
    @videos = @clientv.get_all("colaboratory")


    @client = SoundcloudProvider.get_client(@user)
    @tracks = @client.get('/me/tracks')
  end

  def update
  end
end
