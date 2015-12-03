# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "nokogiri"
require "open-uri"

doc = Nokogiri::HTML(open("http://study-english.info/vocabulary-questions.php"))

doc.css("tr").each do |tr|
  Card.create(
    original_text: tr.css("td[bgcolor='#FFFFDD']").text,
    translated_text: tr.css("td[bgcolor='#FFFFDD'] + td").text,
    review_date: (DateTime.now.to_date + 3)
  )
end
