class MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to member_path(@member)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def member_params
      params.require(:member).permit(:username, :password)
    end
end
