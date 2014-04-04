class SoundcloudProvider

  def self.get_client(user)
    SoundCloud.new(:access_token => user.providers.find_by(provider_type: "soundcloud").token)
  end
end
