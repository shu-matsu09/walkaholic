class CommunitiesController < ApplicationController
  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      redirect_to root_path
    else
      render new_community_path
    end
  end

  private

  def community_params
    params.require(:community).permit(:name, :detail, user_ids: []).merge(administrator_id: current_user.id)
  end
end
