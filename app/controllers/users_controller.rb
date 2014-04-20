class UsersController < ApplicationController

  before_action :is_authenticated?
  before_action :get_user, except: [ :index, :new, :create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new ( user_params )

    # if @user.save
    #   redirect_to root_url ( @user )
    # else
    #   flash.now[:alert] = @user.errors
    #   render :new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
  end

  def update
    # if
    #   @user.update_attributes ( user_params )
    #   redirect_to root_url( @user )
    # else
    #   flash.now[:alert] = @user.errors
    #   render :edit
    # end
  end

  def destroy
    # @user.destroy
    # redirect_to index_url, notice: "Deleted #{@user.email}."
  end


end


  private

  def get_user
    @user = User.find( params[:id] )
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
