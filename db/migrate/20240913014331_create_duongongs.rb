class CreateDuongongs < ActiveRecord::Migration[7.0]
  def change
    create_table :duongongs do |t|
      t.string :ten_ong
      t.string :loai_ong
      t.string :mau_sac
      t.string :don_vi_ql
      t.references :be_dau, null: false, foreign_key: { to_table: :bes }
      t.references :be_cuoi, null: false, foreign_key: { to_table: :bes }

      t.timestamps
    end

    # Thêm index duy nhất cho be_dau_id và be_cuoi_id
    add_index :duongongs, %i[be_dau_id be_cuoi_id], unique: true
  end
end
