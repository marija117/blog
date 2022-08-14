class Reaction < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  VALID_CATEGORIES = ['like', 'smile', 'thumbs_up']

  validates :category, presence: true, inclusion: { in: VALID_CATEGORIES }
  validates :user_id, uniqueness: { scope: [:comment_id]}

  scope :count_by_category, -> (category) { where(category: category).count }
  scope :user_already_reacted, -> (user) { where user: user}

  after_create_commit { broadcast_append_to self.comment }
  after_destroy_commit { broadcast_replace_to self.comment }

  def self.for_user(user, comment)
    find_by(user_id: user.id, comment_id: comment.id)
  end
end
