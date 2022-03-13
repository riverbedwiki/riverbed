class QuestionsController < ApplicationController
  before_action :require_admin, only: %i[ new create edit update ]

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
    @title = @question.title
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path(@question)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :body)
    end
end
