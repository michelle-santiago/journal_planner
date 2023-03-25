require 'bcrypt'
class User < ApplicationRecord
    has_many :categories
    has_many :tasks, through: :categories

    after_create :generate_token
    validates :email, uniqueness: {case_sensitive: false}, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, presence: true, length: { in: 6..20 }

    def self.sign_up(sign_up_params)
        if (sign_up_params[:password] == sign_up_params[:password_confirmation]) 
            password_hash = BCrypt::Password.create(sign_up_params[:password]) 
            user = User.new(email: sign_up_params[:email], password: password_hash)
            return user
        end
    end

    def self.sign_in(user_params)
        user = find_by(email: user_params[:email])
    
        if user.present?
          return user if BCrypt::Password.new(user.password) == user_params[:password]
        end
    end

    def generate_token
        self.token = (0...50).map {('a'..'z').to_a[rand(26)]}.join
        
        self.save
    end
end
