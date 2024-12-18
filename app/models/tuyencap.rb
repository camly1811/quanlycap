class Tuyencap < ApplicationRecord
  has_many :tuyen_cap_duong_ongs
  has_many :duongongs, through: :tuyen_cap_duong_ongs
  validates :ten_tuyen, presence: { message: 'Không được để trống tên tuyến.' },
                        uniqueness: { message: 'đã tồn tại.' }
  validates :diembatdau, presence: true
  validates :diemketthuc, presence: true

  has_many :tuyencap_bes, dependent: :destroy
  has_many :bes, through: :tuyencap_bes
end
