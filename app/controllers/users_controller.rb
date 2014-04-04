class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])

    @client = SoundcloudProvider.get_client(@user)
    @track = @client.get('/me/tracks')
  end

  def update
  end
end
