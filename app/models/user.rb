require 'bcrypt'
class User < ApplicationRecord
    has_many :categories
    has_many :tasks, through: :categories

    after_create :generate_token
    validates :email, uniqueness: {case_sensitive: false}, presence: true
    validates :password, presence: true

    def self.sign_up(user_params)
        
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
