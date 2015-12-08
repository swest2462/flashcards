require "rails_helper"
RSpec.describe Card, :type => :model do
  describe('original_text not equal translated_text') do
    it 'should compare two words and add error if they equal' do
      card = Card.create(original_text: "ДоМ", translated_text: "дом")
      expect(card.errors[:translated_text]).to include "words must be uniq"
    end
  end

  describe ('review date must increased') do
    it 'inreasing date' do
      card = Card.create(original_text: "test", translated_text: "test")
      card.days3
      expect(card.review_date).to eq (Date.today + 3.days)
    end
  end
end