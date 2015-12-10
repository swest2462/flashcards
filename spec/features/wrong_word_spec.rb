require "rails_helper"

describe 'test with wrong word' do

  it 'wrong word' do
    Card.create(original_text: "word", translated_text: "slovo", review_date:"01.01.1900")
    visit root_path
    fill_in 'user_answer', with: 'wrong word'
    click_button 'Check!'
    expect(page).to have_content 'not right'
  end
end
