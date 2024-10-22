class Be < ApplicationRecord
  geocoded_by :address
  # after_validation :geocode, if: :address_changed?
  validates :loaibe, presence: true, presence: { message: 'Không được để trống loại bể.' }
  validates :coquan, presence: true, presence: { message: 'Không được để trống đơn vị quản lý.'}
  validates :latitude, presence: true, presence: { message: 'Không được để trống vĩ độ.'}
  validates :longitude, presence: true, presence: { message: 'Không được để trống kinh độ.'}
  has_many :duong_ongs_dau, class_name: 'DuongOng', foreign_key: 'be_dau_id'
  has_many :duong_ongs_cuoi, class_name: 'DuongOng', foreign_key: 'be_cuoi_id'

  has_many :tuyencap_bes_as_start, class_name: 'TuyencapBe', foreign_key: 'be_id_dau'
  has_many :tuyencap_bes_as_end, class_name: 'TuyencapBe', foreign_key: 'be_id_cuoi'
end
