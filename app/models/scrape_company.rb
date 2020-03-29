require 'mechanize'

class Scrape_company
    
  def self.runScraper
    agent = Mechanize.new
    links = []
    next_url = ""

    (31..1000).each do |i|
      current_page = agent.get("https://xn--zcklx7evic7044c1qeqrozh7c.com/companies/prefs/13?page=" + i.to_s)
      (3..32).each do |l|
        elements = current_page.search('/html/body/div/div/div['+l.to_s+']/div/h6/a')
        elements.each do |ele|
          links << "https://xn--zcklx7evic7044c1qeqrozh7c.com" + ele[:href]
        end
      end
    end

    links.each do |link|
      # getEachElementFromLink(link)
      getEachElementFromLink(link)
    end
  end


  #すべての要素を取得し、データベースに保存
  def self.getEachElementFromLink(link)
    agent = Mechanize.new
    page = agent.get(link)

    corporate_name = page.search('/html/body/div/div/div[2]/table[2]/tbody/tr[1]/td[2]').inner_text if page.search('/html/body/div/div/div[2]/table[2]/tbody/tr[1]/td[2]')
    postal_code = page.search('/html/body/div/div/div[2]/table[2]/tbody/tr[3]/td[2]').inner_text if page.search('/html/body/div/div/div[2]/table[2]/tbody/tr[3]/td[2]')
    address = page.search('/html/body/div/div/div[2]/table[2]/tbody/tr[4]/td[2]').inner_text if page.search('/html/body/div/div/div[2]/table[2]/tbody/tr[4]/td[2]')
    
    company = Company.where(corporate_name: corporate_name).first_or_initialize
    company.corporate_name = corporate_name
    company.postal_code = postal_code
    company.address = address

    if corporate_name.include?("組合") || corporate_name.include?("基金")
    company.save
    end
  end
end


# //*[@id="main_text"]/div[1]/h3 //法人名
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[4]/td //代表者名
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[2]/td //住所
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[7]/td // 分野
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[5]/td //認証日
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[6]/td/text()[1]　定款に記された目的：1段落目
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[6]/td/text()[2]　定款に記された目的：2段落目
