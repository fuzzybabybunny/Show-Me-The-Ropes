class MessagesController < ApplicationController
  before_action :is_authenticated?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # helper_method :current_user

  def index
    @message = Message.new
  end

  def create
    # @user = User.find_by_id(params[:id])

    MessageMailer.message_guide(message_params).deliver
  end

  private

  def message_params
    params.require(:message).permit(
    :firstName, :lastName, :messageTitle, :messageBody,
    :guideFirstName, :guideLastName, :guideEmail, :pinActivity,
    :pinDescription, :userEmail)
  end

end