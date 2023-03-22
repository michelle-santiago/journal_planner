class AuthController < ApplicationController
    def sign_in
        @user = User.new
    end

    def sign_up
    end

    def new_session
        @user = User.find_by_email(user_params[:email])
        if @user.password == user_params[:password]
            render json: { token: user.token }, status: 200
        else
            redirect_to sign_in_path
        end
        
        # if User.valid_sign_in?(user_params)
        # else
        #     render json: {not_found: true}, status: 403
        # end

        # if user = User.sign_in(user_params)
        #     render json: { token: user.token }, status: 200
        # else
        #     render json: { not_found: true }, status: 403
        # end
    end

    def new_account
        if (sign_up_params[:password] == sign_up_params[:password_confirmation])
            @user = User.sign_up(user_params)
            redirects_to categories_path
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