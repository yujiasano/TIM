class QuestionsController < ApplicationController 
  
  def index
    @questions = Question.includes(:user).order("created_at DESC")
  end

  def new
    @question = Question.new
  end

  def create
    # binding.pry
    @question = Question.create(question_params)
    @question.save
    redirect_to root_path
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.includes(:user)
    @like = Like.new
  end

  def destroy
    question = Question.find(params[:id])
    if  question.destroy
      redirect_to root_path
    else 
      render :show
    end
  end

  def search
    @questions = Question.search(params[:keyword])
  end
  

 private
 def question_params
  # binding.pry
  # params[:question].permit(:image, :contents, :title, :price).merge(user_id: current_user.id)
  params.require(:post).permit(:image, :contents, :title, :price).merge(user_id: current_user.id)
 end

end
