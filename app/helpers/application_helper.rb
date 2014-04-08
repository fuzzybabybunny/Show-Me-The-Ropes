module ApplicationHelper

  def show_login_or_logout
    if @current_user
      return link_to( "Log Out", logout_url, method: :delete)
    else
      return link_to( "Login", login_url, method: :get)
    end
  end

end
