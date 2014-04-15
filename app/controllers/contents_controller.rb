class ContentsController < ApplicationController

  def create

    params["content_items"].each do |index, content|
      if content["content"] == "true"
        content.delete(:content)
        Content.create(content
          # title: content['title'],
          # media_id: content['media_id'].to_i,
          # user_id: content['user_id'].to_i,
          # provider_id: content['provider_id'].to_i
        )
      end
    end
    redirect_to user_path(current_user)
  end

end