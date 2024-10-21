class TuyencapBe < ApplicationRecord
  belongs_to :tuyencap
  belongs_to :be_id_dau, class_name: 'Be'
  belongs_to :be_id_cuoi, class_name: 'Be'
end
