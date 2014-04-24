class MessageMailer < ActionMailer::Base

  # default from: "victor@victorlinphoto.com"

  def message_guide(message_params)
    @firstName = message_params["firstName"]
    @lastName = message_params["lastName"]
    @messageTitle = message_params["messageTitle"]
    @messageBody = message_params["messageBody"]
    @userEmail = message_params["userEmail"]
    @guideFirstName = message_params["guideFirstName"]
    @guideLastName = message_params["guideLastName"]
    @guideEmail = message_params["guideEmail"]
    @pinActivity = message_params["pinActivity"]
    @pinDescription = message_params["pinDescription"]
    mail(to: @guideEmail, from: @userEmail, subject: "Show Me the Ropes Message: " + @messageTitle)
  end

end
