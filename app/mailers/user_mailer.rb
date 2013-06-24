class UserMailer < ActionMailer::Base
  default from: "welcome@shareilm.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Shareilm Password Reset"
  end

  def signup_notification(user)
    @user = user
    @event = Event.last
    mail :to => user.email, :subject => "Welcome to Shareilm!"
  end

  def payment_receipt(user, event)
  	@user = user
  	@event = event
  	mail :to => user.email, :subject => "Shareilm Payment Receipt"
  end

end
