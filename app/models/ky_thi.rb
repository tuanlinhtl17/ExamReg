class KyThi < ApplicationRecord
  has_many :ca_this
  has_many :mon_this

  validates :ten, presence: true
  validates :nam_hoc, presence: true
end
