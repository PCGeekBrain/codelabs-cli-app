require 'openssl'
require 'open-uri'
require 'nokogiri'
require 'pry'

class CodeLabs::Scraper
    def initialize(url='https://codelabs.developers.google.com')
        @url = url
    end
    def scrape
        puts "Loading data...."
        doc = Nokogiri::HTML(open(@url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))
        puts "Parsing data...."
        doc.css('#cards a').each do |card|
            lab = CodeLabs::Lab.new({
                title: card.css('.description').text.split.join(" "), 
                duration: card.css('.card-duration span').text,
                link: @url + card['href'].split("?")[0], 
                author: card.css('.card-author').text,
                last_updated: card.css('.card-updated').text[8..-1].strip
            })
            techs = card.get_attribute('data-category').split(",").each do |tech_name|
                CodeLabs::Tech.find_or_create(tech_name).add_lab(lab)
            end
        end
        # binding.pry
    end
end
