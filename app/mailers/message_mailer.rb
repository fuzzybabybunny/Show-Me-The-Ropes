class MessageMailer < ActionMailer::Base

  default from: "victor@victorlinphoto.com"

  def welcome_email
    # @user = user
    # @url  = 'http://example.com/login'
    mail(to: "victor@victorlinphoto.com", subject: 'Welcome to My Awesome Site')
  end

end
