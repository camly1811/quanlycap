class CreateTuyencapBes < ActiveRecord::Migration[7.0]
  def change
    create_table :tuyencap_bes do |t|
      t.references :tuyencap, null: false, foreign_key: true
      t.references :be, null: false, foreign_key: true

      t.timestamps
    end
  end
end
