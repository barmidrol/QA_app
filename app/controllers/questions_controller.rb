class QuestionsController < ApplicationController
  before_action :admin_user, only: [:create, :new]
  before_action :set_question, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!

  def index
    @questions = Question.all
    @questions = current_user.questions if params[:filter] == 'answered'
    @questions = @questions - current_user.questions if params[:filter] == 'unanswered'
  end

  def create
    @question = Question.create(question_params)
    redirect_to questions_path, notice: 'Question has successfully been added!' if @question.save
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def destroy
    redirect_to questions_path if @question.destroy
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: 'Success!'
    end
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:content, :category_id)
    end

end
