class Admin::ApplicationController < ActionController::Base
  before_action :authorize
  layout "admin"
  def current_user
    @user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def authorize
    unless current_user
      redirect_to login_path, alert: "please login"
    end
  end
end
