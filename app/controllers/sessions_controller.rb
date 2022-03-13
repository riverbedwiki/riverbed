class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by(username: params[:username])&.authenticate(params[:password])
    if member
      session[:user_id] = member.id
      redirect_to member_path(member)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
