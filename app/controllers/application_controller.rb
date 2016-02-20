class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  protected
    def authorize
      return if User.count.zero? # to handle new system without administrator

      if request.format == Mime::HTML
        user = User.find_by(id: session[:user_id])
      else
        user = authenticate_or_request_with_http_basic do |user, password|
          User.find_by_name(user).try(:authenticate, p)
        end
      end
      
      redirect_to login_url, notice: "Please log in" unless user
    end
end
