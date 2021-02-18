class Cloth < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    validates :name, presence: true, length: { maximum: 50 }
    
    belongs_to :user
end
