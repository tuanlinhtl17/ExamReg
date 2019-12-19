class SinhVien < ApplicationRecord
  #Devise
  devise :database_authenticatable, :recoverable, 
         :rememberable, :validatable

  attr_accessor :skip_password_validation

  has_many :khong_du_dieu_kiens, dependent: :destroy
  has_many :du_dieu_kiens, dependent: :destroy
  has_many :dang_kys, dependent: :destroy

  #Validation
  validates :id, presence: true, uniqueness: {message: :uniqueness}
  validates :ten, presence: true
  validates_date :ngay_sinh, 
                  invalid_date_message: :invalid_date_message,
                  before: lambda { 18.years.ago },
                  before_message: :before_message
  validates :khoa, presence: true
  validates :lop, presence: true

  def load_mon_this
    du_dieu_kiens.includes(:mon_thi)
    mon_this = []
    du_dieu_kiens.each do |ddk|
      mon_this << ddk.mon_thi if ddk.mon_thi.ky_thi.is_active?
    end
    mon_this
  end

  def dang_ky_thi ca_thi_id, phong_may_id
    ca_thi_id = ca_thi_id.to_i
    phong_may_id = phong_may_id.to_i
    ca_thi = CaThi.find_by id: ca_thi_id
    ca_thi_phong_may = CaThiPhongMay.find_by ca_thi_id: ca_thi_id, phong_may_id: phong_may_id
    if ca_thi && ca_thi_phong_may && load_mon_this.include?(ca_thi.mon_thi)
      # Xoa toan bo cac dang ky thi truoc do cua sinh vien nay doi voi mon thi nay roi tao moi dang ky

      mon_thi = ca_thi.mon_thi
      ca_this = mon_thi.ca_this
      # Lay toan bo cac ca_thi_phong_may cua mon thi dang dang ky
      ca_thi_phong_mays = []
      ca_this.each do |ca_thi|
        ca_thi_phong_mays += ca_thi.ca_thi_phong_mays
      end
      # Lay toan bo cac dang ky cua sinh vien nay doi voi mon dang dang ky va xoa
      dang_kys = []
      ca_thi_phong_mays.each do |ca_thi_phong_may|
        dang_kys += ca_thi_phong_may.dang_kys.select {|dang_ky| dang_ky.sinh_vien_id == id}
      end
      dang_kys.map(&:delete)
      # Tao dang ky moi
      dang_ky = DangKy.new sinh_vien_id: id, ca_thi_phong_may_id: ca_thi_phong_may.id
      if dang_ky.save
        return { error: false }
      else
        return { error: true, dang_ky: dang_ky }
      end
    else 
      return { error: true }
    end
  end

  protected

  def password_required?
    return false if skip_password_validation
    super
  end
end
