class WelcomeController < ApplicationController
  def index
    if current_user
      @all_content = Content.order(created_at: :desc)
      render "/contents/index"
    end
  end


end
