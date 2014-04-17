require 'spec_helper'

describe StaticPagesController do

  describe "GET 'help'" do
    it "returns http success" do
      get 'help'
      response.should be_success
    end
  end

  describe "GET 'about_us'" do
    it "returns http success" do
      get 'about_us'
      response.should be_success
    end
  end

  describe "GET 'learn_more'" do
    it "returns http success" do
      get 'learn_more'
      response.should be_success
    end
  end

end
