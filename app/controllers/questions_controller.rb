class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :require_login, :only => [:new, :create]

  def index
    unless params[:sort]
      params[:sort] = 'newest'
    end
    case params[:sort]
    when 'newest'
      @questions = questions
    when 'unanswered'
      @questions = questions.not.in(id: Answer.pluck(:question_id))
    end
    @questions = @questions.page(params[:page]).per(25)
  end

  def show
    session[:return_to_url] = request.url
    @answer = nil
  end

  def new
    @question = my_questions.new
  end

  def edit
  end

  def create
    @question = my_questions.new(question_params)

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
      Question.order_by(created_at: -1)
    end

    def my_questions
      Question.where(user: current_user)
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
