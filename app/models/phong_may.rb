class PhongMay < ApplicationRecord
  has_many :ca_this, dependent: :destroy
end
