class TestMailer < ApplicationMailer
    default from: 'testmail@exmaple.com'

    def testmail(str,email)
      @str = str
      @email = email
      mail(to: "sunsukeyo1@gmail.com", subject: "メールの件名")
    end
  end
