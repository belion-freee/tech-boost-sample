require "net/http"

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def google
    res = request.env['omniauth.auth']
    if res
      token = res.credentials.token

      url = "https://www.googleapis.com/youtube/v3/channels?part=snippet,contentDetails,statistics,topicDetails&mine=true&access_token=#{token}"
      response = JSON.parse(Net::HTTP.get(URI.parse(URI.escape(url))))


      if response.try(:[], :errors)
        render json: { errors: response.errors }, status: :bad_request
      else
        key = "discribe your key"
        urll = "https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=#{response["items"].first["id"]}&key=#{key}"
        videos = JSON.parse(Net::HTTP.get(URI.parse(URI.escape(urll))))

        body = {
          token: token,
          response: response,
          videos: videos
        }
        render json: body
      end
    else
      render json: { errors: "Sorry! Error omniauth" }, status: :bad_request
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
