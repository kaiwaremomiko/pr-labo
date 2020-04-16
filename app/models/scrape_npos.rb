require 'mechanize'

class Scrape_npos
    
  def self.runScraper
    agent = Mechanize.new
    links = []
    next_url = ""

    (500..700).each do |i|
      current_page = agent.get("https://www.npo-homepage.go.jp/npoportal/list?ket=&page=" + i.to_s)
      (1..50).each do |l|
        elements = current_page.search('//*[@id="main-body-mobile"]/table/tbody/tr['+l.to_s+']/td[2]/a')
        elements.each do |ele|
          links << ele[:href]
        end
      end
    end

    links.each do |link|
      # getEachElementFromLink(link)
      getEachElementFromLink(link)
    end
  end


  #県のみを取得し、データベースに保存
  def self.addPrefectureToNpos(link)
    agent = Mechanize.new
    page = agent.get(link)

    corporate_name = page.search('//*[@id="main_text"]/div[1]/h3').inner_text if page.search('//*[@id="main_text"]/div[1]/h3')
    prefecture = page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[1]/td').inner_text if page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[1]/td')
    
    npo = Npo.where(corporate_name: corporate_name).first_or_initialize
    npo.prefecture = prefecture

    npo.save
  end

  #すべての要素を取得し、データベースに保存
  def self.getEachElementFromLink(link)
    agent = Mechanize.new
    page = agent.get(link)


    corporate_name = page.search('//*[@id="main_text"]/div[1]/h3').inner_text if page.search('//*[@id="main_text"]/div[1]/h3')
    prefecture = page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[1]/td').inner_text if page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[1]/td')
    address = page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[2]/td').inner_text if page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[2]/td')
    representative =  page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[4]/td').inner_text if page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[4]/td')
    certification_date = page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[5]/td').inner_text if page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[5]/td')
    field = page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[7]/td').inner_text if page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[7]/td')
    establish_purpose = page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[6]/td').inner_text if page.search('//*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[6]/td')
    
    npo = Npo.where(corporate_name: corporate_name).first_or_initialize
    npo.corporate_name = corporate_name
    npo.prefecture = prefecture
    npo.address = address
    npo.representative = representative
    npo. certification_date = certification_date
    npo.field = field
    npo.establish_purpose = establish_purpose

    npo.save
  end
end


# //*[@id="main_text"]/div[1]/h3 //法人名
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[4]/td //代表者名
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[2]/td //住所
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[7]/td // 分野
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[5]/td //認証日
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[6]/td/text()[1]　定款に記された目的：1段落目
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[6]/td/text()[2]　定款に記された目的：2段落目
