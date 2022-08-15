require 'rails_helper'

RSpec.describe Reaction, type: :model do
  context 'validation tests' do
    it 'ensures user_id presence' do
      reaction = Reaction.new(category: "like", comment_id: 1).save
      expect(reaction).to eq(false)
    end

    it 'ensures comment_id presence' do
      reaction = Reaction.new(category: "like", user_id: 1).save
      expect(reaction).to eq(false)
    end
  
    it 'ensures category presence' do
      reaction = Reaction.new(user_id: 1, comment_id: 1).save
      expect(reaction).to eq(false)
    end

    it 'ensures uniqueness user_id on one comment' do
      reaction = Reaction.new(category: "like", comment_id: 1, user_id: 1).save
      second_reaction = Reaction.new(category: "smile", comment_id: 1, user_id: 1).save
      expect(second_reaction).to eq(false)
    end

    it 'ensures value of category' do
      reaction = Reaction.new(category: "dislike", comment_id: 1, user_id: 1).save
      expect(reaction).to eq(false)
    end

    it 'should save successfully' do
      reaction = Reaction.new(comment_id: 1, category: 'like', user_id: 1).save
      expect(reaction).to eq(true)
    end
  end
end