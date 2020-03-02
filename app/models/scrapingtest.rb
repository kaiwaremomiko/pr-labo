require 'mechanize'

class Scrapingtest

  def self.testscrape
    agent = Mechanize.new
    links = []

    (1..30).each do |l| #何ページまでスクレイプするか指定
        page = agent.get("https://xn--zcklx7evic7044c1qeqrozh7c.com/companies/prefs/13?page=" + l.to_s)
        (3..19).each do |i|
            elements = page.search('/html/body/div/div/div['+i.to_s+']/div/h6/a') #3~19
            elements.each do |ele|
            links << "https://xn--zcklx7evic7044c1qeqrozh7c.com" + ele[:href]
            end
        end
    end
    links.each do |link|
        getEachElementFromLink(link)
    end
  end


  #すべての要素を取得し、データベースに保存
  def self.getEachElementFromLink(link)
    agent = Mechanize.new
    page = agent.get(link)

    company_name = page.search('/html/body/div/div/div[2]/table[2]/tbody/tr[1]/td[2]').inner_text if page.search('/html/body/div/div/div[2]/table[2]/tbody/tr[1]/td[2]')
    postal_code = page.search('/html/body/div/div/div[2]/table[2]/tbody/tr[3]/td[2]').inner_text if page.search('/html/body/div/div/div[2]/table[2]/tbody/tr[3]/td[2]')
    address = page.search('/html/body/div/div/div[2]/table[2]/tbody/tr[4]/td[2]').inner_text if page.search('/html/body/div/div/div[2]/table[2]/tbody/tr[4]/td[2]')
    pref = page.search('/html/body/div/div/div[2]/div[4]/div/p/a[1]').inner_text if page.search('/html/body/div/div/div[2]/div[4]/div/p/a[1]')
    city = page.search('/html/body/div/div/div[2]/div[4]/div/p/a[2]').inner_text if page.search('/html/body/div/div/div[2]/div[4]/div/p/a[2]')
    area = pref + city
    
    company = Company.where(company_name: company_name).first_or_initialize
    company.company_name = company_name
    company.postal_code = postal_code
    company.address = address
    company.area = area

    company.save
  end
end
