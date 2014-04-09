class RookieMessagesController < ApplicationController

  def index
    @rookie_messages = RookieMessage.all
  end

  def show
    @rookie_message = RookieMessage.find_by_id(params[:id])
  end

end