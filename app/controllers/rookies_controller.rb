class RookiesController < ApplicationController

  def index
    @rookies = Rookie.all
  end

  def show
    @rookie = Rookie.find_by_id(params[:id])
  end

  def create
    @rookies = Rookie.new(rookie_params)

    if @rookies.save
      render :index, status: :created, location: rookie_url(@rookies)
    else
      head :unprocessable_entity
    end
  end

  def update
    @rookies = Rookie.find params[:id]

    if @rookies
      if @rookies.update_attributes(rookie_params)
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    @rookies = Rookie.find params[:id]

    if @rookies
      if @rookies.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

end