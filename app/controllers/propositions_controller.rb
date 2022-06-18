class PropositionsController < ApplicationController
  before_action :set_proposition, only: [:show, :edit, :update]
  before_action :require_admin, only: [:new, :create, :edit, :update]

  def index
    @propositions = Proposition.all
  end

  def show
  end

  def new
    @proposition = Proposition.new
  end

  def create
    @proposition = Proposition.new(proposition_params)

    if @proposition.save
      redirect_to proposition_path(@proposition)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @proposition.update(proposition_params)
      redirect_to proposition_path(@proposition)
    else
      render :edit
    end
  end

  private
    def set_proposition
      @proposition = Proposition.find(params[:id])
    end

    def proposition_params
      params.require(:proposition).permit(:title, :body)
    end
end
