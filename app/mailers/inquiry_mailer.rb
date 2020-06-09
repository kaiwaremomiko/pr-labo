class InquiryMailer < ApplicationMailer
    default from: 'prlaboinquiry@prlabo.net'
    
    def mail(str)
        @contact = str
        mail to: "sunsukeyo1@gmail.com", subject: "メールのタイトル"
    end
end
