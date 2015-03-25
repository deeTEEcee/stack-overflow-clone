class AnswersController < ApplicationController
  before_action :get_question, only: [:create]
  before_action :set_answer, only: [:edit, :destroy]
  before_action :require_login

  def create
    @answer = Answer.where(question: @question, user: current_user).new(answer_params)
    if @answer.save
      redirect_to question_path(@question, @question.title.parameterize)
    else
      render 'questions/show'
    end
  end

  def edit
  end

  def destroy
  end

  private
    def get_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:description)
    end
end
