class LikesController < ApplicationController
  before_action :pedometer_params
  
  def create
    Like.create(user_id: current_user.id, pedometer_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, pedometer_id: params[:id]).destroy
  end

  private

  def pedometer_params
    @pedometer = Pedometer.find(params[:id])
  end
end
