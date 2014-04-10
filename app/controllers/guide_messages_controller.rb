class GuideMessagesController < ApplicationController

  def index
    @guide_messages = GuideMessage.all
  end

  def show
    @guide_message = GuideMessage.find_by_id(params[:id])
  end

end