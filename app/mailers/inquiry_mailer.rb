class InquiryMailer < ApplicationMailer
    default from: 'prlaboinquiry@prlabo.net'

    def mail(str)
      @str = str
      mail(to: "sunsukeyo1@gmail.com", subject: "詳細ページ経由問い合わせ")
    end
end
