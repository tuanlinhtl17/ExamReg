class SinhVien < ApplicationRecord
  #Devise
  devise :database_authenticatable, :recoverable, 
         :rememberable, :validatable

  attr_accessor :skip_password_validation

  has_many :khong_du_dieu_kiens
  has_many :du_dieu_kiens

  #Validation
  validates :id, presence: true, uniqueness: {message: :uniqueness}
  validates :ten, presence: true
  validates_date :ngay_sinh, before: lambda { 18.years.ago },
                               before_message: :before_message
  validates :khoa, presence: true
  validates :lop, presence: true

  protected

  def password_required?
    return false if skip_password_validation
    super
  end
end
