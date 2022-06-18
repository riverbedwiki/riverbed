class PerspectivesController < ApplicationController
  before_action :set_perspective, only: [:show, :edit, :update]
  before_action :require_admin, only: [:new, :create, :edit, :update]

  def index
    @perspectives = Perspective.all
  end

  def show
  end

  def new
    @perspective = Perspective.new
  end

  def create
    @perspective = Perspective.new(perspective_params)

    if @perspective.save
      redirect_to perspective_path(@perspective)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @perspective.update(perspective_params)
      redirect_to perspective_path(@perspective)
    else
      render :edit
    end
  end

  private
    def set_perspective
      @perspective = Perspective.find(params[:id])
    end

    def perspective_params
      params.require(:perspective).permit(:title, :body)
    end
end
