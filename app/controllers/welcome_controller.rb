class WelcomeController < ApplicationController
  def index
    if current_user
      @all_content = Content.order(created_at: :desc)
      render "/contents/index"
    else
      @hide_navbar = true
    end
  end


end
