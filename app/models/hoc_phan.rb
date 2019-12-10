class HocPhan < ApplicationRecord
  has_many :mon_this

  validates :ten, presence: true
  validates :so_tin_chi, presence: true
end
