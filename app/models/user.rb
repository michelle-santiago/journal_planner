require 'bcrypt'
class User < ApplicationRecord
    has_secure_password
    has_many :categories
    has_many :tasks, through: :categories

    after_create :generate_token
    validates :email, uniqueness: {case_sensitive: false}, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, presence: true, length: { in: 6..20 }

    # def self.sign_up(sign_up_params)
    #     print sign_up_params.inspect
    #     print "hello"
    #     if (sign_up_params[:password] == sign_up_params[:password_confirmation]) 
    #         password_hash = BCrypt::Password.create(sign_up_params[:password]) 
    #         print password_hash
    #         print "sign up password hash check"
    #         user = User.new(email: sign_up_params[:email], password: password_hash)
          
    #         return user
    #     end
    # end

    # def self.sign_in(user_params)
    #     user = find_by(email: user_params[:email])
    
    #     if user.present?
    #         print user.password
    #         print "oi sign in password hash check"
    #         print "oou test encrypt"
    #         print "for testing"
    #         # print BCrypt::Password.create("123456")
    #         # @test = "123456"
    #         # @check=BCrypt::Password.new(test)
    #         # print check
            

            
    #       return user if BCrypt::Password.new(user_params[:password]) == user.password
    #     end
    # end

    def generate_token
        self.token = (0...50).map {('a'..'z').to_a[rand(26)]}.join
        
        self.save
    end
end
