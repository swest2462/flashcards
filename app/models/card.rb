class Card < ActiveRecord::Base

  validates :original_text,  :translated_text, presence: true

  validate :translated_properly

  before_update :days3

  scope :cards_older_today, -> { where("review_date < ?", Date.today)}

  def days3
    self.review_date = Date.today + 3.days
  end

  def translated_properly
    if original_text.mb_chars.downcase == translated_text.mb_chars.downcase
     errors.add(:translated_text, 'words must be uniq')
    end
  end
end
