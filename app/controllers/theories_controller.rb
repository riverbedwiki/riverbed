class TheoriesController < ApplicationController
  before_action :require_login, only: %i[ new create edit update ]

  def new
    @theory = Theory.new
  end

  def edit
    @theory = Theory.find(params[:id])
  end

  def show
    @theory = Theory.find(params[:id])
    @title = @theory.name
  end

  def create
    @theory = Theory.new(theory_params)

    if @theory.save
      redirect_to theory_path(@theory)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @theory = Theory.find(params[:id])

    if @theory.update(theory_params)
      redirect_to theory_path(@theory)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def theory_params
      params.require(:theory).permit(:name, :body)
    end
end
