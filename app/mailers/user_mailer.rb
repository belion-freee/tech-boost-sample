class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    subject = 'ご登録ありがとうございます！'
    mail(
      to: @user.email,
      subject: subject
    )
  end
end
