module ApplicationHelper

  def roles(user)
    r = []
    if user.dj
      r.push "DJ"
    end
    if user.producer
      r.push "Producer"
    end
    if user.rapper
      r.push "Rapper"
    end
    if user.singer
      r.push "Singer"
    end
    if user.songwriter
      r.push "Songwriter"
    end
    if user.musician
      r.push "Musician"
    end
    if user.animator
      r.push "Animator"
    end
    if user.filmmaker
      r.push "Filmmaker"
    end
    if user.videographer
      r.push "Videographer"
    end
    if user.editor
      r.push "Editor"
    end
    r
  end

end
