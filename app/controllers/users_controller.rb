class UsersController < ApplicationController
  def index
  end

  def user_profile
    # should only be available to current_user

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

    if @user.providers.where(provider_type: "google_oauth2").first

      user_token = @user.providers.where(provider_type: "google_oauth2").first.token

      @youtubes = YoutubeProvider.new.get_videos_for(user_token)
    end

  end

  def show
    @user = User.find(params[:id])
    @contents = @user.contents
  end

  def edit
    # should only be available to current_user
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      location: params[:location],
      website: params[:website],
      bio: params[:bio],
      dj: params[:dj],
      producer: params[:producer],
      rapper: params[:rapper],
      singer: params[:singer],
      musician: params[:musician],
      animator: params[:animator],
      filmmaker: params[:filmmaker],
      videographer: params[:videographer],
      animator: params[:editor])

      redirect_to user_profile_path(@user.id), notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end
end
