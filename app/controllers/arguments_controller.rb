class ArgumentsController < ApplicationController
  before_action :set_proposition
  before_action :set_argument, only: [:show, :edit, :update]
  before_action :require_admin, only: [:new, :create, :edit, :update]

  def show
  end

  def new
    @argument = @proposition.arguments.new
  end

  def create
    @argument = @proposition.arguments.new(argument_params)

    if @argument.save
      redirect_to proposition_argument_path(@proposition, @argument)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @argument.update(argument_params)
      redirect_to proposition_argument_path(@proposition, @argument)
    else
      render :edit
    end
  end

  private
    def set_proposition
      @proposition = Proposition.find(params[:proposition_id])
    end

    def set_argument
      @argument = @proposition.arguments.find(params[:id])
    end

    def argument_params
      params.require(:argument).permit(:title, :body, :subject_type, :subject_id, :type)
    end
end
