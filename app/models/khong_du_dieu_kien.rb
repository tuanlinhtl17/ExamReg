class KhongDuDieuKien < ApplicationRecord
  belongs_to :mon_thi
  belongs_to :sinh_vien

  validates :ly_do, presence: true
end
