class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = :"zh-CN"
  end

  def current_user
    @member ||= Member.find_by(id: session[:user_id])
  end

  def require_login
    unless current_user
      redirect_to new_session_path
    end
  end

  def require_admin
    unless current_user&.admin?
      redirect_to new_session_path
    end
  end
end
