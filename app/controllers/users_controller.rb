class UsersController < ApplicationController
  def index
  end

  def dashboard
    # should only be available to current_user

    @user = current_user

    # if current_user
    vimeo_provider = @user.providers.where(provider_type: "vimeo").first
    if vimeo_provider 
      @clientv = Vimeo::Advanced::Video.new(ENV["VIMEO_KEY"], ENV["VIMEO_SECRET"],
        :token => vimeo_provider.token,
        :secret => vimeo_provider.secret)
      @videos = @clientv.get_all(vimeo_provider.uid)
    end

    if @user.providers.where(provider_type: "soundcloud").first
      @client = SoundcloudProvider.get_client(@user)
      @tracks = @client.get('/me/tracks')
    end

    if @user.providers.where(provider_type: "google_oauth2").first

      user_token = @user.providers.where(provider_type: "google_oauth2").first.token

      @youtubes = YoutubeProvider.new.get_videos_for(user_token)
    end
    # else
      #redirect_to "/"
    # end

  end

  def show
    @user = User.find(params[:id])
    @contents = @user.contents
  end

  def edit

    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      location: params[:location],
      website: User.website_update(params[:website]),
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

      redirect_to dashboard_path, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end
end
