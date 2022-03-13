class ObjectionsController < ApplicationController
  before_action :set_theory
  before_action :require_admin, only: %i[ new create edit update ]

  def new
    @objection = @theory.objections.new
  end

  def edit
    @objection = @theory.objections.find(params[:id])
  end

  def create
    @objection = @theory.objections.new(objection_params)

    if @objection.save
      redirect_to theory_path(@theory)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @objection = @theory.objections.find(params[:id])

    if @objection.update(objection_params)
      redirect_to theory_path(@theory)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_theory
      @theory = Theory.find(params[:theory_id])
    end

    def objection_params
      params.require(:objection).permit(:title, :body)
    end
end
