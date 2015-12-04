class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:update, :show]

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.create(answer_params)
    @question = Question.find(params[:question_id])
    @answer.user_id = current_user.id
    @answer.question_id = @question.id
    redirect_to questions_path, notice: "Your answer accepted!" if @answer.save
  end

  def update
    @answer = Answer.find(params[:id])
    redirect_to questions_path, notice: 'Your answer accepted!' if @answer.update(answer_params)
  end

  def show
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
  end

  private

    def correct_user
      @answer = Answer.find(params[:id])
      redirect_to questions_path, alert: "Insufficient rights!" unless @answer.user_id == current_user.id
    end

    def answer_params
      params.require(:answer).permit(:content)
    end
end
