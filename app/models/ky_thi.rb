class KyThi < ApplicationRecord
  has_many :ca_this, dependent: :destroy
  has_many :mon_this, dependent: :destroy

  validates :ten, presence: true
  validates :nam_hoc, presence: true
  validates_date :bat_dau_dang_ky, 
                  invalid_date_message: :invalid_date_message,
                  on_or_after: :today,
                  on_or_after_message: :on_or_after_message
  validates_date :ket_thuc_dang_ky, 
                  invalid_date_message: :invalid_date_message,
                  on_or_after: :bat_dau_dang_ky,
                  on_or_after_message: :on_or_after_message

  def get_phong_may
    phong_mays = []
    ca_this.each do |ct|
      phong_mays += ct.phong_mays
    end
    phong_mays
  end

  def is_active?
    return true if (bat_dau_dang_ky <= Date.today && Date.today <= ket_thuc_dang_ky)
  end
end
