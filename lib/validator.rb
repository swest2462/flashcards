class MyValidator < ActiveModel::Validations
  def validate(original,translated)
    if :original_text == :translated_text
      record.errors[:original_text, :translated_text] << ‘Must be uniq’
    end
  end
end
