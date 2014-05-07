class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_many :providers
  has_many :contents

  def self.find_or_create_with_omniauth(auth_hash)
    user = User.find_by(uid: auth_hash['uid'], provider_type: auth_hash['provider']) || create_with_omniauth(auth_hash) 
  end

  def self.create_with_omniauth(auth_hash)
    self.create!(
      username: auth_hash['info']['nickname'],
      avatar: auth_hash['info']['image'],
      email: auth_hash['info']['email']
      )
  end

  def avatar_with_default
    if self.avatar
      self.avatar
    else
      "https://i1.wp.com/i.vimeocdn.com/portrait/default-red_300x300.png?ssl=1"
    end
  end

  def self.website_update(website)
    if website.include?("http://")
      website
    else
      "http://" + website
    end
  end
  
end
