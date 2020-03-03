class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :category
  scope :filter_by_category, -> (category_id) { where category_id: category_id }
  has_rich_text :content
end
