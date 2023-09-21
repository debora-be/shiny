require 'nokogiri'
require 'httparty'

class BookScraper

  URL = "https://www.penguin.co.uk/articles/2022/05/100-must-read-classic-books"

  def self.scrape_and_populate
    parsed_page = HTTParty.get(URL)
    doc = Nokogiri::HTML(parsed_page.body)

    doc.css('h3').each do |book_element|
      title = book_element.text.strip
      author_name = book_element.next_element&.text&.strip

      author = Author.find_or_create_by(name: author_name)
      Book.find_or_create_by(title: title, author: author)
    end
  end
end
