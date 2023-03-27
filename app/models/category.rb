class Category < ApplicationRecord
     belongs_to :user
     has_many :tasks
     validates :name, uniqueness: {case_sensitive: false, scope: :user_id}, presence: true
     validates :user_id, presence: true
     
end

