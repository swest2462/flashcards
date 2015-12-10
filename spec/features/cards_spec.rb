require "rails_helper"

describe 'Card/check features'  do
  it 'create card' do
    visit new_card_path
    fill_in 'card_original_text', with: 'Windows'
    fill_in 'card_translated_text', with: 'Okna'
    click_button 'Create Card'
    expect(Card.where(original_text: 'Windows', translated_text: 'Okna').count).to eq(1)
  end

  it 'test with right word' do
    card = Card.create(original_text: "zzz", translated_text: "www")
    card.update(review_date: Date.today - 1.day)

    visit root_path
    fill_in 'user_answer', with: "zzz"
    click_button 'Check!'
    expect(page).to have_content 'well done'
  end

  it 'test with wrong word' do
    card = Card.create(original_text: "word", translated_text: "slovo")
    card.update(review_date: Date.today - 1.day)

    visit root_path
    fill_in 'user_answer', with: 'wrong word'
    click_button 'Check!'
    expect(page).to have_content 'not right'
  end
end
