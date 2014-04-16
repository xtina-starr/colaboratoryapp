class Content < ActiveRecord::Base
  belongs_to :user
  belongs_to :provider

  def search(search_term)
    User.includes(:content).where("username LIKE :query OR name LIKE :query OR bio LIKE :query OR media_type LIKE :query", query: %search_term% )
  end

end
