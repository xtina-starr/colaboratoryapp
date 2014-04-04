class User < ActiveRecord::Base
  has_many :providers
  has_many :contents

  def self.create_from_omniauth(auth_hash)
    self.create!(
      username: auth_hash['info']['username']
      )
  end
end
