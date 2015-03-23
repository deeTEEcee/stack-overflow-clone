class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :require_login, :only => [:new, :edit]

  def index
    @questions = Question.all
  end

  def show
    if params[:title] != @question.title.parameterize
      redirect_to question_path(@question, @question.title.parameterize)
    end
    @answer = nil

  end

  def new
    @question = questions.new
  end

  def edit
  end

  def create
    @question = questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = questions.find(params[:id])
    end

    def questions
      Question.all
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
