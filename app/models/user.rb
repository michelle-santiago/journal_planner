require 'bcrypt'
class User < ApplicationRecord
    has_secure_password
    has_many :categories
    has_many :tasks, through: :categories

    after_create :generate_token
    validates :email, uniqueness: {case_sensitive: false}, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, presence: true, length: { in: 6..20 }

    def generate_token
        self.token = (0...50).map {('a'..'z').to_a[rand(26)]}.join
        
        self.save
    end
end
