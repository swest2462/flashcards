class MyValidator < ActiveModel::Validator
  def validate(original,translated)
    unless :original_text == :translated_text
      record.errors[:original_text, :translated_text] << ‘Must be uniq’
    end
  end
end

