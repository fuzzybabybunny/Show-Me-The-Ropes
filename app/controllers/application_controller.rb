class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_filter :make_action_mailer_user_request_host_and_protocol

  def index
  end

  def profile
  end

  def is_authenticated?
    # check session hash for a :user_id (true/false)
    # not session[:user_id].nil?
    # redirect_to login_url if session[:user_id].nil?
    redirect_to login_url unless current_user
  end

  def current_user
    # Notice that we don't need to do User.new for this. Because User is a Mongo thing.
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_user_in(user, notice = nil)
    if user
      session[:user_id] = user.id
      redirect_to admin_url, notice: notice
    end
  end

  def flash_notice_user_created(notice = nil)
    redirect_to admin_url, notice: notice
  end

  def log_user_out
    session[:user_id] = nil
    redirect_to login_url, notice: "You've successfully logged out."
  end

  private

  def make_action_mailer_user_request_host_and_protocol
    ActionMailer::Base.default_url_options[:protocol] = request.protocol
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

end
