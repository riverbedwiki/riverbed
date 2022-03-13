class ApplicationController < ActionController::Base
  def current_user
    @member ||= Member.find_by(id: session[:user_id])
  end

  def require_login
    unless current_user
      redirect_to new_session_path
    end
  end
end
