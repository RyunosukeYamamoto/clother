class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :description, length: { maximum: 255 }
  
  belongs_to :user
  has_many :post_relationships, dependent: :destroy
  has_many :wearing_cloths, through: :post_relationships, source: :cloth
  has_many :favorites, dependent: :destroy
  
  
  def add_cloth(cloth)
    if self.user == cloth.user
      self.post_relationships.find_or_create_by(cloth_id: cloth.id)
    end
  end
  
  def delete_cloth(cloth)
    relationship = self.post_relationships.find_by(cloth_id: cloth.id)
    relationship.destroy if relationship
  end
  
  def already_add(cloth)
    self.wearing_cloths.include?(cloth)
  end
end
