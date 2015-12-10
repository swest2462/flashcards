require "rails_helper"

describe 'test with right word' do

  it 'right word' do
    Card.create(original_text: "zzz", translated_text: "www", review_date:"01.01.1900")
    visit root_path
        save_and_open_page
    fill_in 'user_answer', with: "zzz"
    click_button 'Check!'
    expect(page).to have_content 'well done'
  end
end
