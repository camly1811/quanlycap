class CreateTuyenCapDuongOngs < ActiveRecord::Migration[7.0]
  def change
    create_table :tuyen_cap_duong_ongs do |t|
      t.references :tuyencap, null: false, foreign_key: true
      t.references :duongong, null: false, foreign_key: true

      t.timestamps
    end
  end
end
