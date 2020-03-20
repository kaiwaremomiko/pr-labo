require 'mechanize'

class Scrape_occupation
    
  def self.runScraper
    (1..366).each do |i|
      link = "https://shigoto.mhlw.go.jp/User/Occupation/Detail/" + i.to_s
      getEachElementFromLink(link)
    end
  end


  #すべての要素を取得し、データベースに保存
  def self.getEachElementFromLink(link)
    agent = Mechanize.new
    page = agent.get(link)

    occupation_name = page.search('//*[@id="inner-content"]/div/div/div/div/div[2]/div[1]/div/h1').inner_text if page.search('//*[@id="inner-content"]/div/div/div/div/div[2]/div[1]/div/h1')
    category = page.search('//*[@id="page-detail"]/div[1]/div/div/div[3]/div[3]/h4/a[1]').inner_text if page.search('//*[@id="page-detail"]/div[1]/div/div/div[3]/div[3]/h4/a[1]')
    work_contents = page.search('//*[@id="kind-of-work"]/div[2]/div[1]/div/p[1]').inner_text if page.search('//*[@id="kind-of-work"]/div[2]/div[1]/div/p[1]')
    how_to_work = page.search('//*[@id="how-get-job"]/div[2]/p[1]').inner_text if page.search('//*[@id="how-get-job"]/div[2]/p[1]')
    under_high_school_graduate = page.search('//*[@id="chart"]/div/div[2]/div[2]/div/div/span/span[2]').inner_text if page.search('//*[@id="chart"]/div/div[2]/div[2]/div/div/span/span[2]')
    high_school_graduate = page.search('//*[@id="chart"]/div/div[3]/div[2]/div/div/span/span[2]').inner_text if page.search('//*[@id="chart"]/div/div[3]/div[2]/div/div/span/span[2]')
    college_graduate = page.search('//*[@id="chart"]/div/div[7]/div[2]/div/div/span').inner_text if page.search('//*[@id="chart"]/div/div[7]/div[2]/div/div/span')
    number_employee = page.search('//*[@id="working-condition"]/div[4]/div[1]/div[2]/p[1]').inner_text if page.search('//*[@id="working-condition"]/div[4]/div[1]/div[2]/p[1]')
    working_time = page.search('//*[@id="working-condition"]/div[4]/div[2]/div[2]/p[1]').inner_text if page.search('//*[@id="working-condition"]/div[4]/div[2]/div[2]/p[1]')
    payment = page.search('//*[@id="working-condition"]/div[5]/div[1]/div[2]/p[1]').inner_text if page.search('//*[@id="working-condition"]/div[5]/div[1]/div[2]/p[1]')
    age = page.search('//*[@id="working-condition"]/div[5]/div[2]/div[2]/p[1]').inner_text if page.search('//*[@id="working-condition"]/div[5]/div[2]/div[2]/p[1]')

    
    occupation = Occupation.where(occupation_name: occupation_name).first_or_initialize
    occupation.category = category.gsub(/[[:space:]]/, '')
    occupation.work_contents = work_contents.gsub(/[[:space:]]/, '')
    occupation.how_to_work = how_to_work.gsub(/[[:space:]]/, '')
    occupation.under_high_school_graduate = under_high_school_graduate.gsub(/[[:space:]]/, '')
    occupation.high_school_graduate = high_school_graduate.gsub(/[[:space:]]/, '')
    occupation.college_graduate = college_graduate.gsub(/[[:space:]]/, '').gsub("大卒", "") 
    occupation.number_employee = number_employee.gsub(/[[:space:]]/, '')
    occupation.working_time = working_time.gsub(/[[:space:]]/, '')
    occupation.payment = payment.gsub(/[[:space:]]/, '')
    occupation.age = age.gsub(/[[:space:]]/, '')
    
    occupation.save
  end
end


# //*[@id="main_text"]/div[1]/h3 //法人名
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[4]/td //代表者名
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[2]/td //住所
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[7]/td // 分野
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[5]/td //認証日
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[6]/td/text()[1]　定款に記された目的：1段落目
# //*[@id="main_text"]/div[2]/div/table[1]/tbody/tr[6]/td/text()[2]　定款に記された目的：2段落目
