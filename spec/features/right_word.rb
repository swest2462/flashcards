require "rails_helper"

describe 'test with wrong word' do

  it 'right word' do
    Card.create(original_text: "zzz", translated_text: "www", review_date: "01.01.1900")
    visit root_path
    fill_in 'user_answer', with: 'zzz'
    click_button 'Проверить!'
    expect(page).to have_content 'well done'
  end
end