class Temp < ApplicationRecord
  validates :max, numericality: { only_integer: true }, allow_blank: true
  validates :min, numericality: { only_integer: true }, allow_blank: true
  validates :name, presence: true, length: { maximum: 10 }
  
  validate :temp_validate
  
  validate :max_bigger_min
  
  belongs_to :user
  
  has_many :relationship_temps, dependent: :destroy
  has_many :temps_category, through: :relationship_temps, source: :category
  
  def add_category(category)
    if self.user == category.user
      self.relationship_temps.find_or_create_by(category_id: category.id)
    end
  end
  
  def delete_category(category)
    relationship = self.relationship_temps.find_by(category_id: category.id)
    relationship.destroy if relationship
  end
  
  def have_category?(category)
    self.temps_category.include?(category)
  end

  
  private
  
  def temp_validate
    errors.add(:max, 'maxかminどちらかは必ず入力して下さい') if max == nil && min == nil
  end
  
  def max_bigger_min
    if max.present? && min.present?
      errors.add(:max, 'maxはminより大きい値を入力して下さい。') if max < min
    end
  end
end
