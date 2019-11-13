class SinhVien < ApplicationRecord
  validates :ten, presence: true
  validates :ma_sv, presence: true
  validates_date :ngay_sinh, before: lambda { 18.years.ago },
                               before_message: "Phải ít nhất 18 tuổi"
  validates :khoa, presence: true
  validates :lop, presence: true
end
