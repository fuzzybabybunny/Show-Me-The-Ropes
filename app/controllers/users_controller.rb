class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def create
    @users = User.new(user_params)

    if @users.save
      render :index, status: :created, location: user_url(@users)
    else
      head :unprocessable_entity
    end
  end

  def update
    @users = User.find params[:id]

    if @users
      if @users.update_attributes(user_params)
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    @users = User.find params[:id]

    if @users
      if @users.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end



end