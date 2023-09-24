require 'nokogiri'
require 'httparty'
require 'json'

class BookScraper
  URL = "https://www.penguin.co.uk/genres/fiction-books"

  def self.scrape_and_populate
    parsed_page = HTTParty.get(URL)
    doc = Nokogiri::HTML(parsed_page.body)

    # Locate the script tag with the id="__NEXT_DATA__"
    script_tag = doc.at('script[id="__NEXT_DATA__"]')
    return unless script_tag
 
    # Parsing the content of the script tag as JSON
    data = JSON.parse(script_tag.content)
 
    genre_pages = data["props"]["pageProps"]["genrePages"]
 
    genre_pages.each do |genre|
      title_name = genre["title"]
      uri = genre["uri"]
      slug_name = genre["slug"]

      slug = Slug.find_or_create_by(slug: slug_name)
      Book.find_or_create_by(title: title_name, slug: slug, uri: uri)
    end
  end
end
