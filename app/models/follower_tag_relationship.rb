class FollowerTagRelationship < ActiveRecord::Base
  belongs_to :tag
  belongs_to :user, foreign_key: "follower_id"
end
