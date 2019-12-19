class CaThiPhongMay < ApplicationRecord
  belongs_to :ca_thi
  belongs_to :phong_may

  has_many :dang_kys, dependent: :destroy

  validates :phong_may_id, uniqueness: { scope: :ca_thi_id, message: :uniqueness }
end
