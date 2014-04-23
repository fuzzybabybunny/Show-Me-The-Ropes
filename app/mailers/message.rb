class Message < ActionMailer::Base

  LINK_TO_RESET = "[VLP] Reset your credentials"
  WAS_RESET     = "[VLP] Your password has been reset!"

  default from: "Victor Lin Photography <victor@victorlinphoto.com>"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: LINK_TO_RESET
  end


  def password_was_reset(user)
    @user = user
    mail to: @user.email, subject: WAS_RESET
  end


end
