class Page < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :tags, through: :page_tag_relationships
  has_many :page_tag_relationships, dependent: :destroy
  validates :title, :link, presence: true
end
