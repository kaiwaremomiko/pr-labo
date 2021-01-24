require 'nokogiri'
require 'open-uri'
 
class Nokogiri_scraper

    def self.runScraper
        url = "https://www.ipros.jp/company/detail/311997/"
        
        # NokogiriでURLの情報を取得する
        doc = Nokogiri::HTML(open(url))
        td = doc.css('.box-table--06')
        puts td
    end
end
#table/tbody/tr[1]/td
#/section[2]/div/div