class Reaction < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  VALID_CATEGORIES = ['like', 'smile', 'thumbs_up']

  validates :category, presence: true, inclusion: { in: VALID_CATEGORIES }
  validates :user_id, uniqueness: { scope: [:comment_id]}

  scope :count_by_category, -> (category) { where(category: category).count }
end
