class AnswersController < ApplicationController
  before_action :set_question
  before_action :set_answer, only: [:show, :edit, :update]
  before_action :require_admin, only: [:new, :create, :edit, :update]

  def index
  end

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to question_answer_path(@question, @answer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to question_answer_path(@question, @answer)
    else
      render :edit
    end
  end

  private
    def set_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = @question.answers.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:reference_type, :reference_id, :body)
    end
end
