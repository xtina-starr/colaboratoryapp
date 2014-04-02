class SoundcloudController < ApplicationController

  def client
    @client = SoundCloud.new({
      client_id:  ENV["SOUNDCLOUD_CLIENT_ID"],
      client_secret: ENV["SOUNDCLOUD_SECRET"],
      redirect_uri: "localhost:3000"
      })

    redirect client.authorize_url()
  end
end