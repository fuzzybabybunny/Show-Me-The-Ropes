class MessageMailer < ActionMailer::Base

  default from: "victor@victorlinphoto.com"

  def welcome_email(message_params)
    @firstName = message_params["firstName"]
    @lastName = message_params["lastName"]
    @messageTitle = message_params["messageTitle"]
    @messageBody = message_params["messageBody"]
    @currentUserEmail = message_params["currentUserEmail"]
    mail(to: "victor@victorlinphoto.com", subject: "Show Me the Ropes Message: " + @messageTitle)
  end

end
