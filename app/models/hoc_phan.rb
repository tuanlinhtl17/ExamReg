class HocPhan < ApplicationRecord
  validates :ten, presence: true
  validates :so_tin_chi, presence: true
end
