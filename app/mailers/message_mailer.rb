class MessageMailer < ActionMailer::Base

  default from: "victor@victorlinphoto.com"

  def welcome_email(message_params)
    @first_name = message_params["firstName"]
    @last_name = message_params["lastName"]
    @messageTitle = message_params["messageTitle"]
    @messageBody = message_params["messageBody"]
    @currentUserEmail = message_params["currentUserEmail"]
    mail(to: "victor@victorlinphoto.com", subject: @messageTitle)
  end

end
