class QuestionsController < ApplicationController 
  
  def index
    @questions = Question.includes(:user)
  end

  def new
    @question = Question.new
  end

  def create
    # binding.pry
    @question = Question.create(question_params)
    redirect_to root_path
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.includes(:user)
  end

 private
 def question_params
  params.require(:question).permit(:image, :contents, :title).merge(user_id: current_user.id)
 end

end
