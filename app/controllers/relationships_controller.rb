class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    unless user.followed_by?(current_user)
      relationship = Relationship.new(
        follower_id: current_user.id, followed_id: user.id)
      relationship.save
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = User.find(params[:user_id])
    if user.followed_by?(current_user)
      relationship = Relationship.find_by(
        follower_id: current_user.id, followed_id: user.id)
      relationship.destroy
    end
    redirect_back(fallback_location: root_path)
  end
end
