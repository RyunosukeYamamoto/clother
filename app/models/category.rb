class Category < ApplicationRecord
  belongs_to :user
  
  has_many :relationship_categories
  has_many :categorized_cloths, through: :relationship_categories, source: :cloth
end
