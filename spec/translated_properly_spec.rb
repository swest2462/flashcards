require "rails_helper"

  describe('original_text not equal translated_text') do
    it 'should compare two words and add error if they equal' do
      card = Card.create(original_text: "ДоМ", translated_text: "дом")
      expect(card.errors[:translated_text]).to include "words must be uniq"
    end
  end

  describe ('review date must increased') do
    it 'inreasing date' do
      card = Card.create(original_text: "word", translated_text: "another word", review_date: "01.01.1900")
      expect(card.review_date).to eq (Date.today + 3.days)
    end
  end

  describe ('wrong word did not pass') do
    it 'wrong word' do
      card = Card.create(original_text: "word", translated_text: "word", review_date: "01.01.1900")

      expect(Card.count).to eq 0
    end
  end