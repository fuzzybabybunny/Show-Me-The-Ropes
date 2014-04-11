class PinsController < ApplicationController

  def index
    @pins = Pin.all
    @users = User.all
  end

  def show
    @pin = Pin.find_by_id(params[:id])
    @user = User.find_by_id(params[:id])
  end

end