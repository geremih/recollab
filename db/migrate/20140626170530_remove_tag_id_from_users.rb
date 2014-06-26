class RemoveTagIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :tag_id, :integer
  end
end
