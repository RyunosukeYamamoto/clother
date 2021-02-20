class Temp < ApplicationRecord
  validates :max, numericality: { only_integer: true }, allow_blank: true
  validates :min, numericality: { only_integer: true }, allow_blank: true
  
  validate :temp_varidate
  
  validate :max_bigger_min
  
  belongs_to :user
  
  private
  
  def temp_varidate
    errors.add(:max, 'maxかminどちらかは必ず入力して下さい') if max == nil && min == nil
  end
  
  def max_bigger_min
    if max.present? && min.present?
      errors.add(:max, 'maxはminより大きい値を入力して下さい。') if max < min
    end
  end
end
