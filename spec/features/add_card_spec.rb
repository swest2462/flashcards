require "rails_helper"
context "fill fields in form"  do
    it 'fill fields in form' do
      visit new_card_path
        fill_in 'card[original_text]', with: 'word'
        fill_in 'card[translated_text]', with: 'slovo'
      click_button 'Create Card'
      expect(Card.count).to eq 1
    end
  end