class SinhVien < ApplicationRecord
  #Devise
  devise :database_authenticatable, :recoverable, 
         :rememberable, :validatable

  attr_accessor :skip_password_validation

  #Validation
  validates :ten, presence: true
  validates :ma_sv, presence: true, uniqueness: {message: :uniqueness}
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
