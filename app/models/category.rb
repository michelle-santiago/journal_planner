class Category < ApplicationRecord
     validates :name, uniqueness: {case_sensitive: false}, presence: true
     validates :user_id, presence: true
     belongs_to :user
     has_many :tasks
end

