class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @user = User.find_by(id: session[:user_id])
    end
    
    private

    def require_login
      return head(:forbidden) unless session.include? :user_id
    end
end
