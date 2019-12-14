class PhongMay < ApplicationRecord
  has_many :ca_thi_phong_mays, dependent: :destroy
  has_many :ca_this, through: :ca_thi_phong_mays
end
