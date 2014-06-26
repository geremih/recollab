class CreateFollowerTagRelationships < ActiveRecord::Migration
  def change
    create_table :follower_tag_relationships do |t|
      t.integer :follower_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
