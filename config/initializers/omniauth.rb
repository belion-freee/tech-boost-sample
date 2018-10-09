Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "854289636455-0qbfu4rsqbv94ipkbvckigo0hpurek2f.apps.googleusercontent.com", "sAe19TZX7WKhPj_4HQ3SIJTL",
  scope: "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/youtube"
end
