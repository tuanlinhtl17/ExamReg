class MonThi < ApplicationRecord
  belongs_to :ky_thi
  belongs_to :hoc_phan
  
  has_many :khong_du_dieu_kiens
  has_many :du_dieu_kiens
  has_many :khong_du_dieu_kiens_imports
  has_many :du_dieu_kiens_imports

  validates :hoc_phan_id, presence: true
  validates :hoc_phan_id, uniqueness: { scope: :ky_thi_id, message: :uniqueness }
end
