class Be < ApplicationRecord
  geocoded_by :address
  # after_validation :geocode, if: :address_changed?
  validates :loaibe, presence: true
  validates :coquan, presence: true

  has_many :duong_ongs_dau, class_name: 'DuongOng', foreign_key: 'be_dau_id'
  has_many :duong_ongs_cuoi, class_name: 'DuongOng', foreign_key: 'be_cuoi_id'

  has_many :tuyencap_bes
  has_many :tuyencaps, through: :tuyencap_bes
end
