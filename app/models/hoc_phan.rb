class HocPhan < ApplicationRecord
  has_many :mon_this, dependent: :destroy

  validates :ten, presence: true, length: { minimum: 5, maximum: 30 }
  validates :so_tin_chi, presence: true, numericality: { greater_than_or_equal_to: 1,  only_integer: true }
end
