require 'mechanize'

class Scrape_makingcompany

  def self.runScraper
    agent = Mechanize.new
    links = []
    next_url = ""

    (1..10).each do |i|
      current_page = agent.get("https://www.ipros.jp/company/category/1/1?s=1&l=45&p=" + i.to_s)
      (1..45).each do |l|
        elements = current_page.search('//*[@id="content-body"]/div[1]/div[1]/div/ul/li['+l.to_s+']/a')
        elements.each do |ele|
          links << ele[:href]
        end
      end
    end

    links.each do |link|
      getEachElementFromLink(link)
    end
  end

  def self.testScrape
    url = "https://www.ipros.jp/company/detail/311997?hub=24"
    getEachElementFromLink(url)
  end

  #すべての要素を取得し、データベースに保存
  def self.getEachElementFromLink(link)
    agent = Mechanize.new
    page = agent.get(link)

    big_category = '電子部品・モジュール'
    elements = page.search('/html/body/main/div[2]/div[1]/div[2]/div[1]/section[2]/div/div/table')
    puts elements

    # corporate_name = page.search('//*[@id="company-detail"]/div/table/tbody/tr[1]/td').inner_text if page.search('//*[@id="company-detail"]/div/table/tbody/tr[1]/td')
    # puts corporate_name
    # establishment = page.search('//*[@id="company-detail"]/div/table/tbody/tr[2]/td').inner_text if page.search('//*[@id="company-detail"]/div/table/tbody/tr[2]/td')
    # capital = page.search('//*[@id="company-detail"]/div/table/tbody/tr[3]/td').inner_text if page.search('//*[@id="company-detail"]/div/table/tbody/tr[3]/td')
    # employees = page.search('//*[@id="company-detail"]/div/table/tbody/tr[4]/td').inner_text if page.search('//*[@id="company-detail"]/div/table/tbody/tr[4]/td')
    # industry = page.search('//*[@id="companyInfoInHeader"]/li[1]/dl/dd').inner_text if page.search('//*[@id="companyInfoInHeader"]/li[1]/dl/dd')
    # tel_number = page.search('//*[@id="twilio-tel-number"]') if page.search('//*[@id="twilio-tel-number"]')
    # postal_code = page.search('//*[@id="company-detail"]/div/table/tbody/tr[5]/td/div[1]/p/text()[1]') if page.search('//*[@id="company-detail"]/div/table/tbody/tr[5]/td/div[1]/p/text()[1]')
    # address = page.search('//*[@id="companyInfoInHeader"]/li[2]/dl/dd').inner_text if page.search('//*[@id="companyInfoInHeader"]/li[2]/dl/dd')
    # official_site = page.search('//*[@id="company_info_home_page"]/a').inner_text if page.search('//*[@id="company_info_home_page"]/a')
    
    # manufacture = Manufacture.where(corporate_name: corporate_name).first_or_initialize
    # manufacture.big_category = big_category
    # manufacture.corporate_name = corporate_name
    # manufacture.establishment = establishment
    # manufacture.capital = capital
    # manufacture.employees = employees
    # manufacture.industry = industry
    # manufacture.tel_number = tel_number
    # manufacture.postal_code = postal_code
    # manufacture.official_site = official_site

    # manufacture.save
  end
end

