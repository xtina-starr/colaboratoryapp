class Provider < ActiveRecord::Base
  belongs_to :user

  def self.find_or_create_with_omniauth(auth_hash)
    provider = Provider.find_by(user_id: user_id, provider_type: auth_hash['provider']) || create_with_omniauth(auth_hash, user_id) 
  end

  def self.create_with_omniauth(auth_hash, user_id)
    self.create!(
      user_id: user_id,
      uid: auth_hash['uid'],
      username: auth_hash['info']['nickname'],
      avatar: auth_hash['info']['image'],
      token: auth_hash['credentials']['token'],
      secret: auth_hash['credentials']['secret'],
      email: auth_hash['info']['email'],
      provider_type: auth_hash['provider']
      )

  end
end
