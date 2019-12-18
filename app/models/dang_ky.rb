class DangKy < ApplicationRecord
  belongs_to :sinh_vien
  belongs_to :ca_thi_phong_may

  validate :so_may_trong
  validates :ca_thi_phong_may_id, uniqueness: { scope: :sinh_vien_id, message: :uniqueness }
  
  after_save :update_so_may_trong_phong_may
  after_destroy :update_so_may_trong_phong_may

  def get_mon_thi
    get_ca_thi.mon_thi
  end

  def get_ca_thi
    ca_thi_phong_may.ca_thi
  end

  def get_phong_may
    ca_thi_phong_may.phong_may
  end

  private

  def update_so_may_trong_phong_may
    ca_thi_phong_may.phong_may.update_so_may_trong
  end

  def so_may_trong
    if ca_thi_phong_may.phong_may.so_may_trong == 0
      errors.add(:ca_thi_phong_may, "Số máy trống trong phòng không đủ để đăng ký")
    end
  end
end
