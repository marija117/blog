class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :text, presence: true, length: { minimum: 10 }
end
