class TopController < ActionController::Base
  #before_filter :authenticate_user!

  def index
    if request.xhr?
      p "111111"
    end
  end
end
