class User < ActiveRecord::Base
  has_many :providers
  has_many :contents

  def self.create_from_omniauth(auth_hasah)
    self.create!(
      username: auth_auth['extra']['username']
      )
  end
end
