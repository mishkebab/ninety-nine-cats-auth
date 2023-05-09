class UsersController < ApplicationController

    before_action :require_logged_out, only: [:new, :create]
    # before_action :require_logged_in, only: [:show, :edit, :update]

    def new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to cats_url
        else
            @errors = @user.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
