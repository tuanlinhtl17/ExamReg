class KyThi < ApplicationRecord
  has_many :ca_this, dependent: :destroy
  has_many :mon_this, dependent: :destroy

  validates :ten, presence: true
  validates :nam_hoc, presence: true
end
