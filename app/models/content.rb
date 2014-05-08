class Content < ActiveRecord::Base
  belongs_to :user
  belongs_to :provider

  def self.search_content(search_term)
    # User.includes(:contents).where("username LIKE :query OR name LIKE :query OR bio LIKE :query OR contents.title LIKE :query", query: "%#{search_term}%" )

    Content.includes(:user).where("title ILIKE :query OR users.username ILIKE :query OR users.bio ILIKE :query", query: "%#{search_term.downcase}%" )
  end

  def self.collaboration
    self.where("collab = ?", true)
  end

  def self.feedback
    self.where("feedback = ?", true)
  end

  def self.latest
    self.where("latest = ?", true)
  end

end
