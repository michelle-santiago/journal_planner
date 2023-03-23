require 'bcrypt'
class AuthController < ApplicationController
    #get /sign_in
    def sign_in
        @user = User.new
    end
    #get /sign_up
    def sign_up
        @user = User.new
    end

    def new_session
        @user = User.new(email: user_params[:email], password: user_params[:password])
        if @user.email.empty?
            @user.errors.add(:email,"can't be blank")
        elsif @user.password.empty?
            @user.errors.add(:password,"can't be blank")
        else 
            user = User.sign_in(user_params)
            if user #email is present and have correct password
                redirect_to categories_path
            else
                @user.errors.add(:email,"or")
                @user.errors.add(:password,"invalid")
            end                
        end
        render :sign_in, status: :unprocessable_entity if @user.errors.count > 0
    end

    def new_account
        puts "asdasdasdas"
        if (sign_up_params[:password]) === ""
            puts "yes opo empty"
        else
            puts "hindi po empty" 
            puts (sign_up_params[:password])            #walaaa
            puts (sign_up_params[:password]) == ""      #false
            puts (sign_up_params[:password]).to_s === "" #true
            puts (sign_up_params[:password]).class      #nil
        end
        puts "banana"
        puts (sign_up_params[:password]).empty?
        puts "watermelon"
        puts !(sign_up_params[:password]).empty?

        if (sign_up_params[:password] == sign_up_params[:password_confirmation])  #not working   
            password_hash = BCrypt::Password.create(user_params[:password]) 
            @user = User.new(email: user_params[:email], password: password_hash)
            if @user.save
                redirect_to categories_path
            else
                render :sign_up, status: :unprocessable_entity
            end
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