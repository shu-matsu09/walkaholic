class PedometersController < ApplicationController
  def index
    @pedometers = Pedometer.order("created_at DESC")
  end

  def new
    @pedometer = Pedometer.new
  end

  def create
    @pedometer = Pedometer.new(pedometer_params)
    if @pedometer.save
      redirect_to root_path
    else
      render new_pedometer_path
    end
  end

  private

  def pedometer_params
    params.require(:pedometer).permit(:date,:number_of_steps,:condition_id).merge(user_id: current_user.id)
  end

end
