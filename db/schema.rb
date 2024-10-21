# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_10_21_013436) do
  create_table "bes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "address"
    t.string "tenbe"
    t.string "loaibe"
    t.string "coquan"
    t.decimal "latitude", precision: 20, scale: 15
    t.decimal "longitude", precision: 20, scale: 15
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "duongongs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ten_ong"
    t.string "loai_ong"
    t.string "mau_sac"
    t.string "don_vi_ql"
    t.bigint "be_dau_id", null: false
    t.bigint "be_cuoi_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["be_cuoi_id"], name: "index_duongongs_on_be_cuoi_id"
    t.index ["be_dau_id", "be_cuoi_id"], name: "index_duongongs_on_be_dau_id_and_be_cuoi_id", unique: true
    t.index ["be_dau_id"], name: "index_duongongs_on_be_dau_id"
  end

  create_table "tuyen_cap_duong_ongs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "tuyencap_id", null: false
    t.bigint "duongong_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["duongong_id"], name: "index_tuyen_cap_duong_ongs_on_duongong_id"
    t.index ["tuyencap_id"], name: "index_tuyen_cap_duong_ongs_on_tuyencap_id"
  end

  create_table "tuyencap_bes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "tuyencap_id", null: false
    t.bigint "be_id_dau_id", null: false
    t.bigint "be_id_cuoi_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["be_id_cuoi_id"], name: "index_tuyencap_bes_on_be_id_cuoi_id"
    t.index ["be_id_dau_id"], name: "index_tuyencap_bes_on_be_id_dau_id"
    t.index ["tuyencap_id"], name: "index_tuyencap_bes_on_tuyencap_id"
  end

  create_table "tuyencaps", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ten_tuyen"
    t.string "phanloai"
    t.string "dvquanly"
    t.string "diembatdau"
    t.string "diemketthuc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "duongongs", "bes", column: "be_cuoi_id"
  add_foreign_key "duongongs", "bes", column: "be_dau_id"
  add_foreign_key "tuyen_cap_duong_ongs", "duongongs"
  add_foreign_key "tuyen_cap_duong_ongs", "tuyencaps"
  add_foreign_key "tuyencap_bes", "bes", column: "be_id_cuoi_id"
  add_foreign_key "tuyencap_bes", "bes", column: "be_id_dau_id"
  add_foreign_key "tuyencap_bes", "tuyencaps"
end
