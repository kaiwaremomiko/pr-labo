class InquiryMailer < ApplicationMailer
    def contact_mail(contact)
        @contact = contact  
        mail to: "sunsukeyo1@gmail.com", subject: "メールのタイトル"
    end
end
