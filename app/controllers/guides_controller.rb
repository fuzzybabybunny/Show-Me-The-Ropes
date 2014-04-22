class GuidesController < ApplicationController

  def index
    @guides = Guide.all
  end

  def show
    @guide = Guide.find_by_id(params[:id])
  end

  def create
    @guides = Guide.new(guide_params)

    if @guides.save
      render :index, status: :created, location: guide_url(@guides)
    else
      head :unprocessable_entity
    end
  end

  def update
    @guides = Guide.find params[:id]

    if @guides
      if @guides.update_attributes(guide_params)
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    @guides = Guide.find params[:id]

    if @guides
      if @guides.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

end