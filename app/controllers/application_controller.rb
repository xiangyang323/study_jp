class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :login

  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}#{exception.backtrace}"
    end
    return render file:"public/404.html" ,status: 404
  end

  def login
    @user = User.find(1)
  end
end
