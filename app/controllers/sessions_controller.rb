class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]

    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user.authenticate(params[:password])
            return head(:forbidden) unless @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to posts_path
        else
            flash[:errors] = "Username or password was incorrect"
            redirect_to new_session_path
        end
    end

    def logout
        session.destroy
        redirect_to new_user_path
    end
end
