class Provider < ActiveRecord::Base

  def self.create_with_omniauth(auth_hash, user_id)
    self.create!(
      user_id: user_id)
    
  end
end
