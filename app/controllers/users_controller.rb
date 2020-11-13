class UsersController < ApplicationController
    before_action :require_login, only: [:index, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.profile_picture != true
            @user.profile_picture = "data:image/png;base64,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"
        end
        if @user.valid?
            session[:user_id] = @user.id
            @user.save
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.messages
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        session[:user_id] = @user.id
    end

    def edit 
        @user  = User.find_by(id: params[:id])
    end 

    def update 
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        User.find_by(id: params[:id]).destroy
        redirect_to users_path
    end 
    
    private
    
    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation, :about, :profile_picture)
    end
end
