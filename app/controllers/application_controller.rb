class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :basic_auth

  #以下を追記（ユーザー登録）

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, profile_attributes: [:user_id,:first_name,:family_name,:first_name_kana,:family_name_kana,:post_code,:prefecture_id,:city,:address_number,:building,:phone,:birth_date]])
  end

  private

  # 以下を追記
def production?
  Rails.env.production?
end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

end