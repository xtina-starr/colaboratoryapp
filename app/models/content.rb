class Content < ActiveRecord::Base
  belongs_to :user
  belongs_to :provider

  def self.search_content(search_term)
    # User.includes(:contents).where("username LIKE :query OR name LIKE :query OR bio LIKE :query OR contents.title LIKE :query", query: "%#{search_term}%" )

    Content.includes(:user).where("title LIKE :query OR users.username LIKE :query OR users.bio LIKE :query", query: "%#{search_term}%" )
  end

  def self.collaboration
    self.where("collab = ?", true)
  end

  def self.feedback
    self.where("feedback = ?", true)
  end

  def self.latest
    self.where("feedback = ?", true)
  end

end
