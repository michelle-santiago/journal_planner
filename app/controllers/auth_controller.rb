class AuthController < ApplicationController
    def sign_in
    end

    def sign_up
    end

    def new_session
        if User.valid_sign_in?(user_params)
        else
            render json: {not_found: true}, status: 403
        end
    end

    def new_account
        if (sign_up_params[:password] == sign_up_params[:password_confirmation])
            @user = User.sign_up(user_params)
            redirects_to categories.path
        else
            render :sign_up, status: :unprocessable_entity
        end
    end

    def logout
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

    def sign_up_params
        params.permit(:email, :password, :password_confirmation)
    end
end