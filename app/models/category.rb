class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  
  belongs_to :user
  
  has_many :relationship_categories, dependent: :destroy
  has_many :categorized_cloths, through: :relationship_categories, source: :cloth
end
