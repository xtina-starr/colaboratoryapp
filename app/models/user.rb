class User < ActiveRecord::Base
  has_many :providers
  has_many :contents

  def self.find_or_create_with_omniauth(auth_hash)
    user = User.find_by(uid: auth_hash['uid'], provider_type: auth_hash['provider']) || create_with_omniauth(auth_hash) 
  end

  def self.create_with_omniauth(auth_hash)
    self.create!(
      username: auth_hash['info']['nickname']
      )
  end
end
