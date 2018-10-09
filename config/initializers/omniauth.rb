Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "contentId", "secretId",
  scope: "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/youtube"
end
