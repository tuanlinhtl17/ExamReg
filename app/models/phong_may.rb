class PhongMay < ApplicationRecord
  has_many :ca_thi_phong_mays, dependent: :destroy
  has_many :ca_this, through: :ca_thi_phong_mays

  validates :ten, presence: true
  validates :so_may, presence: true

  before_validation :tinh_so_may_trong

  def update_so_may_trong
    tinh_so_may_trong
    self.save
  end

  private

  def tinh_so_may_trong
    dang_kys = []
    ca_thi_phong_mays.includes :dang_kys
    ca_thi_phong_mays.each { |ctpm| dang_kys += ctpm.dang_kys }
    self.so_may_trong = so_may - dang_kys.count
  end
end
