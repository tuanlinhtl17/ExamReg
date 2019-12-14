class KyThi < ApplicationRecord
  has_many :ca_this, dependent: :destroy
  has_many :mon_this, dependent: :destroy

  validates :ten, presence: true
  validates :nam_hoc, presence: true

  def get_phong_may
    phong_mays = []
    ca_this.each do |ct|
      phong_mays += ct.phong_mays
    end
    phong_mays
  end
end
