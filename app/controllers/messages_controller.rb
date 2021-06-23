class MessagesController < ApplicationController
  def index
    @community = Community.find(params[:community_id])
    @message = Message.new
    @messages = @community.messages.includes(:user)
  end

  def create
    @community = community.find(params[:community_id])
    @message = @community.messages.new(message_params)
    if @message.save
      redirect_to community_messages_path(@community)
    else
      @messages = @community.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
