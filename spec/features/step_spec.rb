require "rails_helper"

describe 'test with right word' do

  it 'right word' do
    card = Card.create(original_text: "zzz", translated_text: "www", review_date:"01.01.1900")
    expect(card).to be_valid
  end
end
