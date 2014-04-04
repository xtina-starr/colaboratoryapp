class Soundcloud

  def get_client
    SoundCloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
  end
end