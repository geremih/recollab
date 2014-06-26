class FollowerTagRelationshipsController < ApplicationController
  def create
    FollowerTagRelationship.create(tag_id: params[:follower_tag_relationship][:tag_id] , follower_id: current_user.id)
  end


end
