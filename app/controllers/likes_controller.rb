class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id, answer_id: params[:answer_id])
    # @likes = Like.where(answer_id: params[:answer_id])



    # Like.create(user_id: current_user.id, answer_id: params[:answer_id])
    redirect_to :back
    
  end

  def destroy

    @like = Like.find_by(user_id: current_user.id, answer_id: params[:answer_id])
    @like.destroy

    redirect_to question_path(params[:id])
   
  end
end
