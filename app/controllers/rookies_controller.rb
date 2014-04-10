class RookiesController < ApplicationController

  def index
    @rookies = Rookie.all
  end

  def show
    @rookie = Rookie.find_by_id(params[:id])
  end

end