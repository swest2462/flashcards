require "rails_helper"
context "fill fields in form"  do
    it 'fill fields in form' do
      visit new_card_path
      fill_in 'card_original_text', with: 'Windows'
      fill_in 'card_translated_text', with: 'Okna'
      click_button 'Create Card'
      expect(Card.where(original_text: 'Windows', translated_text: 'Okna').count).to eq(1)
    end

  end