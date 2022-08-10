class Post < ApplicationRecord
    has_many :comments, dependent: :destroy

    validates :text, presence: true, length: { minimum: 10 }
end
