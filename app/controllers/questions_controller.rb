class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def create
    @question = Question.create(question_params)
    redirect_to questions_path, notice: 'Question has successfully been added!' if @question.save
  end

  def new
    @question = Question.new
  end

  private

    def question_params
      params.require(:question).permit(:content)
    end

end
