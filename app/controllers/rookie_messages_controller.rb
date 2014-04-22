class RookieMessagesController < ApplicationController

  def index
    @rookie_messages = RookieMessage.all
  end

  def show
    @rookie_message = RookieMessage.find_by_id(params[:id])
  end

  def create
    @rookie_messages = RookieMessage.new(rookie_message_params)

    if @rookie_messages.save
      render :index, status: :created, location: rookie_message_url(@rookie_messages)
    else
      head :unprocessable_entity
    end
  end

  def update
    @rookie_messages = RookieMessage.find params[:id]

    if @rookie_messages
      if @rookie_messages.update_attributes(rookie_message_params)
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    @rookie_messages = RookieMessage.find params[:id]

    if @rookie_messages
      if @rookie_messages.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

end