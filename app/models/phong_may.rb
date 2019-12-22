class PhongMay < ApplicationRecord
  has_many :ca_thi_phong_mays, dependent: :destroy
  has_many :ca_this, through: :ca_thi_phong_mays

  validates :ten, presence: true, length: { minimum: 2, maximum: 10 }
  validates :so_may, presence: true, numericality: { greater_than_or_equal_to: 10,  only_integer: true }
end
