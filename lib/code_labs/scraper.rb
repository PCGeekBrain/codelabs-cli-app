require 'openssl'
require 'open-uri'
require 'nokogiri'

class CodeLabs::Scraper
    def initialize(url='https://codelabs.developers.google.com')
        @url = url
    end
    def scrape
        puts "Loading data...." # <- show the user what is happening
        doc = Nokogiri::HTML(open(@url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})) # no SSL, SSL is breaking this
        puts "Parsing data...."
        # each of the ~250 cards on the page
        doc.css('#cards a').each do |card|
            # Create a new lab
            lab = CodeLabs::Lab.new({
                title: card.css('.description').text.split.join(" "), # <- there are no titles and these are short enough
                duration: card.css('.card-duration span').text, # is already nice and formatted
                link: @url + card['href'].split("?")[0], # <- the link they can go to
                author: card.css('.card-author').text, # <- the author if he exists
                last_updated: card.css('.card-updated').text[8..-1].strip # <- remove the 'Updated' part
            })
            # now the tech is buried in a coustom polymer attribute, so....
            techs = card.get_attribute('data-category').split(",").each do |tech_name|
                # use find or create to get the tech object by name and add the lab to it
                CodeLabs::Tech.find_or_create(tech_name).add_lab(lab)
            end # <- end tech items
        end # <- end cards
    end # <- end scrape
end # <- end Scraper
