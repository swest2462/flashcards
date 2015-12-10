class Card < ActiveRecord::Base

  validates :original_text,  :translated_text, presence: true

  validate :translated_properly

  before_create :increase_review_date

  scope :cards_older_today, -> { where("review_date < ?", Date.today)}

  def increase_review_date
    self.review_date = Date.today + 3.days
  end

  def translated_properly
    if original_text.mb_chars.downcase == translated_text.mb_chars.downcase
     errors.add(:translated_text, 'words must be uniq')
    end
  end
end
