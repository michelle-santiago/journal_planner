class Task < ApplicationRecord
    belongs_to :category
    validates :title, presence: true
    validates :category_id, presence: true
    validates :priority, presence: true
    validates :status, presence: true
end
