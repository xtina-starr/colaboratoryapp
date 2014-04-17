class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
    @provider = Provider.find_by(uid: auth_hash[:uid].to_s)

    if current_user
      if @provider
        redirect_to dashboard(current_user.id), notice: "This user already exists!"
      else
        provider = Provider.create_with_omniauth(auth_hash, current_user.id)

        redirect_to dashboard(current_user.id), notice: "Account added!"
      end
    else
      if @provider
        session[:user_id] = @provider.user.id
        redirect_to root_path, notice: "You have successfully been signed in!"
      else
        @user = User.create_with_omniauth(auth_hash)
        session[:user_id] = @user.id
        provider = Provider.create_with_omniauth(auth_hash, @user.id)
        redirect_to edit_user_path(@user.id), notice: "You have successfully been signed in!"
      end
    end

  end


   def signout
     session[:user_id] = nil
     redirect_to "/", notice: "You have been successfully signed out."
   end


  def show

  end

end
