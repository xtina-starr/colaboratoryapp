class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
    @provider = Provider.find_by(uid: auth_hash[:uid])

    if current_user
      if @provider
        redirect_to user_path(current_user.id), notice: "This user already exists!"
      else
        provider = Provider.create_with_omniauth(auth_hash, current_user.id)
        redirect_to user_path(current_user.id), notice: "Account added!"
      end
    else
      if @provider
        session[:user_id] = @provider.user.id
        redirect_to user_path(user.id), notice: "You have successfully been signed in!"
      elsif
        @user = User.create_with_omniauth(auth_hash)
        session[:user_id] = @user.id
        provider = Provider.create_with_omniauth(auth_hash, @user.id)
        redirect_to user_path(@user.id), notice: "You have successfully been signed in!"
      else
        redirect_to root_path, notice: "There was a problem signing in!"
      end
    end
  end


   def signout
     session[:user] = nil
     redirect_to "/", notice: "You have been successfully signed out."
   end
    # Vimeo
    # video = Vimeo::Advanced::Video.new(ENV["VIMEO_KEY"], ENV["VIMEO_SECRET"], token: auth_hash.extra.access_token.token, secret: auth_hash.extra.access_token.secret)
    # raise

    # video_embed = Vimeo::Advanced::Video.new(ENV["VIMEO_KEY"], ENV["VIMEO_SECRET"], token: auth_hash.extra.access_token.token, secret: auth_hash.extra.access_token.secret)
    # video_embed.get_presets({ page: "1", per_page: "10" })


  def show

  end

end
