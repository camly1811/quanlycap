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

ActiveRecord::Schema[7.0].define(version: 2024_11_20_034451) do
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

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id"
    t.index ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id"
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

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "gender", default: 0
    t.string "phone"
    t.string "address"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "duongongs", "bes", column: "be_cuoi_id"
  add_foreign_key "duongongs", "bes", column: "be_dau_id"
  add_foreign_key "tuyen_cap_duong_ongs", "duongongs"
  add_foreign_key "tuyen_cap_duong_ongs", "tuyencaps"
  add_foreign_key "tuyencap_bes", "bes", column: "be_id_cuoi_id"
  add_foreign_key "tuyencap_bes", "bes", column: "be_id_dau_id"
  add_foreign_key "tuyencap_bes", "tuyencaps"
end
