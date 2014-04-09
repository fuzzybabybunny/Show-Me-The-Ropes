class GuidesController < ApplicationController

  def index
    @guides = Guide.all
  end

  def show
    @guide = Guide.find_by_id(params[:id])
  end

end