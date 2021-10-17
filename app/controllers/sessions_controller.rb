class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])
        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            session[:user_name] = @user.username
            
            redirect_to index_path
        else
            message="something went wrong ! incorrect"
            redirect_to login_path, notice: message
        end
    end

    def destroy
        
        session.delete(:user_id)
    end
end