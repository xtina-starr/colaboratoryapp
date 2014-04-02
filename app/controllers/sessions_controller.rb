class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth'] 
    client = SoundCloud.new(:access_token => auth_hash.credentials.token)
    raise
  end

end