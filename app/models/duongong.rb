class Duongong < ApplicationRecord
  belongs_to :be_dau, class_name: 'Be'
  belongs_to :be_cuoi, class_name: 'Be'
  validate :be_dau_and_be_cuoi_must_be_different
  validate :be_dau_cuoi_relationship_must_be_unique

  has_many :tuyen_cap_duong_ongs
  has_many :tuyencaps, through: :tuyen_cap_duong_ongs

  private

  def be_dau_and_be_cuoi_must_be_different
    return unless be_dau_id == be_cuoi_id

    errors.add(:be_cuoi, "can't be the same as be_dau")
  end

  def be_dau_cuoi_relationship_must_be_unique
    return unless Duongong.where(be_dau_id: be_cuoi_id, be_cuoi_id: be_dau_id).exists?

    errors.add(:base, 'A Duongong with the same be_dau and be_cuoi relationship already exists')
  end
end
