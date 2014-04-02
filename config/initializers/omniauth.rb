Rails.application.config.middleware.use OmniAuth::Builder do
    provider :vimeo, ENV['VIMEO_KEY'], ENV['VIMEO_SECRET']
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET']
end