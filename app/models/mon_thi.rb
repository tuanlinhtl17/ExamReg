class MonThi < ApplicationRecord
  belongs_to :ky_thi
  belongs_to :hoc_phan
  
  has_many :ca_this, dependent: :destroy
  has_many :khong_du_dieu_kiens, dependent: :destroy
  has_many :du_dieu_kiens, dependent: :destroy
  has_many :khong_du_dieu_kiens_imports, dependent: :destroy
  has_many :du_dieu_kiens_imports, dependent: :destroy

  validates :hoc_phan_id, presence: true
  validates :hoc_phan_id, uniqueness: { scope: :ky_thi_id, message: :uniqueness }
end
