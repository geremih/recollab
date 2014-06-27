class FollowerTagRelationshipsController < ApplicationController
  def create
    FollowerTagRelationship.create(tag_id: params[:tag_id] , follower_id: current_user.id)
    redirect_to user_path(Tag.find(params[:tag_id] ).pages.first.user)
  end
  
  def destroy
    FollowerTagRelationship.find_by(tag_id: params[:tag_id] , follower_id: current_user.id).destroy
    redirect_to user_path(Tag.find(params[:tag_id] ).pages.first.user)
  end

end
