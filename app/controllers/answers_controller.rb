class AnswersController < ApplicationController
  before_action :set_question
  before_action :require_admin, only: %i[ new create edit update ]

  def new
    @answer = @question.answers.new
  end

  def edit
    @answer = @question.answers.find(params[:id])
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to question_path(@question)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @answer = @question.answers.find(params[:id])

    if @answer.update(answer_params)
      redirect_to question_path(@question)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_question
      @question = Question.find(params[:question_id])
    end

    def answer_params
      params.require(:answer).permit(:theory_id, :body)
    end
end
