class ContentsController < ApplicationController

  def index
    @all_content = Content.order(created_at: :desc)
  end

  def show
    @content = Content.find(params[:id])
  end

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

  def search
    search_term = (params[:search])
    uri = URI::encode(search_term)

    @search_results = Content.search_content(uri)
  end

end