class CreateTuyencaps < ActiveRecord::Migration[7.0]
  def change
    create_table :tuyencaps do |t|
      t.string :ten_tuyen
      t.string :phanloai
      t.string :dvquanly
      t.string :diembatdau
      t.string :diemketthuc

      t.timestamps
    end
  end
end
