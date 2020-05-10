class LikesController < ApplicationController

  def create
    
    Like.create(user_id: current_user.id, answer_id: params[:answer_id])

    redirect_to :back
    
  end

  def destroy
    # @like = Like.find(answer_id: params[:answer_id], user_id: current_user.id)
    # @like.destroy
    @like = Like.find_by(user_id: current_user.id, answer_id: params[:answer_id])
    @like.destroy
    redirect_to question_path(params[:id])
    # @likes = Like.where(answer_id: params[:answer_id])
  end
end
