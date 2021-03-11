class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :description, length: { maximum: 255 }
  
  belongs_to :user
end
