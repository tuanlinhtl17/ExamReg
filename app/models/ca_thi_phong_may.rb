class CaThiPhongMay < ApplicationRecord
  belongs_to :ca_thi
  belongs_to :phong_may

  has_many :dang_kys, dependent: :destroy

  validates :phong_may_id, uniqueness: { scope: :ca_thi_id, message: :uniqueness }

  before_validation :tinh_so_may_trong

  def update_so_may_trong
    tinh_so_may_trong
    self.save
  end

  private

  def tinh_so_may_trong
    self.so_may_trong = phong_may.so_may - dang_kys.count
  end
end
