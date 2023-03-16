class Category < ApplicationRecord
     validates :name, uniqueness: {case_sensitive: false}, presence: true
     validates :user_id, presence: true
     has_many :tasks
end

