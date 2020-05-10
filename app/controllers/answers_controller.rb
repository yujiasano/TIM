class AnswersController < ApplicationController

  # def index
  #   @answers = Answer.includes(:user,:question)
  # end
  
  # def new
  #   @answer = Answer.new
  # end

  def create
    # binding.pry
    @answer = Answer.create(answer_params)
    redirect_to question_path(@answer.question.id)
    @like = Like.new
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
  end


  private
  def answer_params
    params.require(:answer).permit(:text, :image).merge(user_id: current_user.id, question_id: params[:question_id])
  end

end
