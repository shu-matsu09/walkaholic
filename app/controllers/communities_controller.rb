class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy, :add_user]

  def index
    @communities = Community.all.order("created_at DESC")
  end
  
  def show
    @community_user_id = CommunityUser.find_by(community_id: @community.id, user_id: current_user.id)
  end
  
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

  def edit
  end

  def update
    @community.update(community_params)
    redirect_to community_path(@community.id)
  end

  def destroy
    @community.destroy
    redirect_to root_path
  end

  def add_user
    CommunityUser.create(user_id: current_user.id, community_id: @community.id)
    redirect_to community_path(@community.id)
  end

  private

  def community_params
    params.require(:community).permit(:name, :detail, user_ids: []).merge(administrator_id: current_user.id)
  end

  def set_community
    @community = Community.find(params[:id])
  end

end
