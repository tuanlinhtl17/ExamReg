class CaThi < ApplicationRecord
  belongs_to :ky_thi
  belongs_to :mon_thi
  
  has_many :ca_thi_phong_mays, dependent: :destroy
  accepts_nested_attributes_for :ca_thi_phong_mays
  has_many :phong_mays, through: :ca_thi_phong_mays

  #Validation
  validates :ten, presence: true, length: { minimum: 5, maximum: 30 }

  validates_date :ngay_thi, 
                  invalid_date_message: :invalid_date_message,
                  on_or_after: :ngay_thi_hop_le,
                  on_or_after_message: :on_or_after_message
  validates_time :bat_dau, 
                  invalid_time_message: :invalid_time_message,
                  between: ['7:00am', '4:00pm'],
                  on_or_before_message: :on_or_before_message,
                  on_or_after_message: :on_or_after_message
  validates_time :ket_thuc, 
                  invalid_time_message: :invalid_time_message,
                  between: ['8:00am', '6:00pm'],
                  on_or_before_message: :on_or_before_message,
                  on_or_after_message: :on_or_after_message
  validate :gio_ket_thuc_gio_bat_dau_hop_le
  validate :trung_gio_thi
  validates_associated :ca_thi_phong_mays

  def get_sinh_vien_by_phong_may phong_may_id
    ctpm_theo_phong_mays = ca_thi_phong_mays.select { |ctpm| ctpm.phong_may_id == phong_may_id }
    
    dang_kys = []
    ctpm_theo_phong_mays.each do |cpm|
      dang_kys += cpm.dang_kys
    end

    sinh_viens = []
    dang_kys.each { |dk| sinh_viens << dk.sinh_vien }
    sinh_viens
  end

  private

  def trung_gio_thi
    ca_this = []
    list_phong_mays = []
    # Lay danh sach phong may thuoc ca thi nay dua theo ca_thi_phong_mays
    ca_thi_phong_mays.each do |ctpm|
      list_phong_mays << PhongMay.find_by(id: ctpm.phong_may_id)
    end
    # Lay cac ca thi o cac phong may trong ca thi nay ma co trung ngay du thi
    list_phong_mays.each do |pm|
      pm.ca_this.each do |ct|
        ca_this << ct if ngay_thi == ct.ngay_thi
      end
    end
    ca_this.delete(self)
    # Kiem tra gio bat dau va ket thuc cua ca thi nay voi cac ca thi truoc xem co trung gio khong
    overlap_time = ca_this.select{ |ca_thi| (bat_dau - ca_thi.ket_thuc) * (ca_thi.bat_dau - ket_thuc) > 0  }
    # Lay danh sach cac phong may bi trung gio
    overlap_time.each do |ct|
      list_phong_mays &= ct.phong_mays
    end
    unless overlap_time.blank?
      danh_sach_ten = ""
      list_phong_mays.each do |pm|
        danh_sach_ten += "#{pm.ten}, "
      end
      errors.add(:bat_dau, "Phòng máy #{danh_sach_ten} đã có ca thi diễn ra vào thời gian này")
    end
  end

  def gio_ket_thuc_gio_bat_dau_hop_le
    if bat_dau && ket_thuc
      errors.add(:bat_dau, "Thời gian kết thúc phải sau thời gian bắt đầu") if bat_dau >= ket_thuc
    end
  end

  def ngay_thi_hop_le
    Date.today < ky_thi.ket_thuc_dang_ky ? ky_thi.ket_thuc_dang_ky : Date.today
  end
end
