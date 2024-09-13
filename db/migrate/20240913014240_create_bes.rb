class CreateBes < ActiveRecord::Migration[7.0]
  def change
    create_table :bes do |t|
      t.string :address
      t.string :tenbe
      t.string :loaibe
      t.string :coquan
      t.decimal :latitude, precision: 20, scale: 15
      t.decimal :longitude, precision: 20, scale: 15

      t.timestamps
    end
  end
end
