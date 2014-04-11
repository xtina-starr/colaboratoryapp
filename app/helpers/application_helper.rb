module ApplicationHelper
  def roles(user)
    if user.dj
      "DJ"
    end
  end
end
