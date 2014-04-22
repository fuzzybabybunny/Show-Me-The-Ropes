class GuideMessagesController < ApplicationController

  def index
    @guide_messages = GuideMessage.all
  end

  def show
    @guide_message = GuideMessage.find_by_id(params[:id])
  end

  def create
    @guide_messages = GuideMessage.new(guide_message_params)

    if @guide_messages.save
      render :index, status: :created, location: guide_message_url(@guide_messages)
    else
      head :unprocessable_entity
    end
  end

  def update
    @guide_messages = GuideMessage.find params[:id]

    if @guide_messages
      if @guide_messages.update_attributes(guide_message_params)
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    @guide_messages = GuideMessage.find params[:id]

    if @guide_messages
      if @guide_messages.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

end