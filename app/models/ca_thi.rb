class CaThi < ApplicationRecord
  belongs_to :ky_thi
  belongs_to :phong_may
  belongs_to :mon_thi

  #Validation
  validates :ten, presence: true

  validates_date :ngay_thi, 
                  invalid_date_message: :invalid_date_message,
                  on_or_after: :today,
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

  private

  def trung_gio_thi
    ca_this = CaThi.where(ngay_thi: ngay_thi)
    overlap = ca_this.select{ |ca_thi| (bat_dau - ca_thi.ket_thuc) * (ca_thi.bat_dau - ket_thuc) > 0  }
    unless overlap.blank?
      errors.add(:bat_dau, "Phòng máy đã có ca thi diễn ra vào thời gian này")
    end
  end

  def gio_ket_thuc_gio_bat_dau_hop_le
    errors.add(:bat_dau, "Thời gian kết thúc phải sau thời gian bắt đầu") if bat_dau >= ket_thuc
  end
end
