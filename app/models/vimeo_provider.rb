class VimeoProvider

  def self.get_client
     Vimeo.new(:access_token => user.providers.find_by(provider_type: "vimeo").token)
  end
end