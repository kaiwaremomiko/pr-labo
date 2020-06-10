class TestMailer < ApplicationMailer
    default from: 'testmail@exmaple.com'

    def testmail(corporate_name,name,email,text)
      @corporate_name = corporate_name
      @name = name
      @email = email
      @text = text
      mail(to: "sunsukeyo1@gmail.com", subject: "メールの件名")
    end
  end
