class BackendController < ApplicationController
  before_action :is_authenticated?

  layout "application"

  def index
  end

end