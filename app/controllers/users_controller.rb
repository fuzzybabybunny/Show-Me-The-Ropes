class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
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
    @current_guide ||= User.find_by(id: session[:user_id]).guide
    @current_rookie ||= User.find_by(id: session[:user_id]).rookie

    if @users
      if @users.update_attributes(user_params)
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end

    if @current_guide
      if @current_guide.update_attributes(:guide_experience => params[:user][:guide_experience])

        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end

    if @current_rookie
      if @current_rookie.update_attributes(:rookie_experience => params[:user][:rookie_experience])
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

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :avatar)
  end

end