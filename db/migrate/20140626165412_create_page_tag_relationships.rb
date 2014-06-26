class CreatePageTagRelationships < ActiveRecord::Migration
  def change
    create_table :page_tag_relationships do |t|
      t.integer :page_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
