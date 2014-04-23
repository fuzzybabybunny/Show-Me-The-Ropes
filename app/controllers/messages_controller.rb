class MessagesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def index
    @message = Message.new
  end

  def create
    # @user = User.find_by_id(params[:id])
    MessageMailer.welcome_email().deliver
  end
end