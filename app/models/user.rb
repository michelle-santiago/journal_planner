class User < ApplicationRecord
    include Bcrypt
    has_many :categories
    has_many :tasks, through: :categories

    after_create :generate_token

    def self.sign_up(user_params)
        password_hash = Password.create(user_params[:password])

        create(email: user_params[:email], password: password_hash)
    end

    def self.valid_sign_in?(user_params)
        user = find_by(email: user_params[:email])
        
        if user.present?
        valid_password = Password.new(user.password) == user_params[:password]            
        else
            false
        end
    end

    def generate_token
        self.token = (0...50).map {('a'..'z').to_a[rand(26)]}.join
        
        self.save
    end
end
