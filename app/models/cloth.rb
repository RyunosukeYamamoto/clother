class Cloth < ApplicationRecord
  mount_uploader :image, ImageUploader
    
  validates :name, presence: true, length: { maximum: 10 }
  validates :image, presence: true
    
  belongs_to :user
    
  has_many :relationship_categories, dependent: :destroy
  has_many :my_categories, through: :relationship_categories, source: :category
  has_many :post_relationships, dependent: :destroy
    
    
  def categorize(category)
    if self.user == category.user
      self.relationship_categories.find_or_create_by(category_id: category.id)
    end
  end
  
  def uncategorize(category)
    relationship = self.relationship_categories.find_by(category_id: category.id)
    relationship.destroy if relationship
  end
  
  def categorized?(category)
    self.my_categories.include?(category)
  end
end
