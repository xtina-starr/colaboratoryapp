require "./spec_helper"

describe YoutubeProvider do
  describe "token_expired?" do
    before do
      @expired_provider = Provider.create!(:expiresat => Time.now - 86400)

    end

    it "should return true on expired" do
      YoutubeProvider.token_expired?(@expired_provider).should == true
    end

    pending "should return false if not expired" do
      "later"
    end

    pending "should return false if expires_at is nil" do
      "later"
    end
  end
end
