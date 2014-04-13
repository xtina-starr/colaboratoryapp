class ContentsController < ApplicationController

  def create
    params["'content_items'"].each do |content|
      content = Content.create(
        title: content["'title'"],
        media_id: content["'media_id'"],
        user_id: content["'user_id'"],
        provider_id: content["'provider_id'"]
      )
    end
  end

end