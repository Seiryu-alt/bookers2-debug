class ThanksMailer < ApplicationMailer
  def send_thanks_mail(user)
    @user = user
    mail(
      from: "seiryusain@gmail.com",
      to: @user.email,
      subject: "会員登録が完了しました"
    )
  end
end
