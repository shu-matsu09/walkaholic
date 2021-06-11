class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @pedometers = @user.pedometers
  end

end
