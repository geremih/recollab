class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :pages, through: :page_tag_relationships
  has_many :page_tag_relationships
end
