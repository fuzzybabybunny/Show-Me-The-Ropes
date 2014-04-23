class PinsController < ApplicationController

  def index
    @pins = Pin.all
    @users = User.all
  end

  def show
    @pin = Pin.find_by_id(params[:id])
    @user = User.find_by_id(params[:id])
  end

  def create
    @pins = Pin.new(pin_params)

    if @pins.save
      render :index, status: :created, location: pin_url(@pins)
    else
      head :unprocessable_entity
    end
  end

  def update
    @pins = Pin.find params[:id]

    if @pins
      if @pins.update_attributes(pin_params)
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    @pins = Pin.find params[:id]

    if @pins
      if @pins.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :activity, :description, :lat, :long, :guide_id)
  end

end