module ApplicationHelper
  def roles(user)
    if user.dj
      "DJ"
    end
    if user.producer
      "producer"
    end
    if user.rapper
      "rapper"
    end
    if user.singer
      "singer"
    end
    if user.songwriter
      "songwriter"
    end
    if user.musician
      "musician"
    end
    if user.animator
      "animator"
    end
    if user.filmmaker
      "filmmaker"
    end
    if user.videographer
      "videographer"
    end
    if user.editor
      "editor"
    end
  end
end
