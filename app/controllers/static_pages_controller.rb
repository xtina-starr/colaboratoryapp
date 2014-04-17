class StaticPagesController < ApplicationController
  def faq
    @hide_navbar = true
  end

  def about_us
    @hide_navbar = true
  end

  def learn_more
    @hide_navbar = true
  end

  def signup
    @hide_navbar = true
  end

  def signin
    @hide_navbar = true
  end
end
