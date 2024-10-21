class CreateTuyencapBes < ActiveRecord::Migration[7.0]
  def change
    create_table :tuyencap_bes do |t|
      t.references :tuyencap, null: false, foreign_key: true
      t.references :be_id_dau, null: false, foreign_key: { to_table: :bes }
      t.references :be_id_cuoi, null: false, foreign_key: { to_table: :bes }

      t.timestamps
    end
  end
end
