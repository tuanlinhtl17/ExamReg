# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_12_055354) do

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "ca_this", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ten"
    t.datetime "bat_dau"
    t.datetime "ket_thuc"
    t.date "ngay_thi"
    t.bigint "ky_thi_id"
    t.bigint "phong_may_id"
    t.bigint "mon_thi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ky_thi_id"], name: "index_ca_this_on_ky_thi_id"
    t.index ["mon_thi_id"], name: "index_ca_this_on_mon_thi_id"
    t.index ["phong_may_id"], name: "index_ca_this_on_phong_may_id"
  end

  create_table "du_dieu_kiens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "mon_thi_id"
    t.bigint "sinh_vien_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mon_thi_id"], name: "index_du_dieu_kiens_on_mon_thi_id"
    t.index ["sinh_vien_id"], name: "index_du_dieu_kiens_on_sinh_vien_id"
  end

  create_table "du_dieu_kiens_imports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "status"
    t.text "sub_du_dieu_kiens_errors"
    t.bigint "mon_thi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "excel_file_name"
    t.string "excel_content_type"
    t.integer "excel_file_size"
    t.datetime "excel_updated_at"
    t.index ["mon_thi_id"], name: "index_du_dieu_kiens_imports_on_mon_thi_id"
  end

  create_table "hoc_phans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ten"
    t.integer "so_tin_chi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "khong_du_dieu_kiens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "mon_thi_id"
    t.bigint "sinh_vien_id"
    t.text "ly_do"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mon_thi_id"], name: "index_khong_du_dieu_kiens_on_mon_thi_id"
    t.index ["sinh_vien_id"], name: "index_khong_du_dieu_kiens_on_sinh_vien_id"
  end

  create_table "khong_du_dieu_kiens_imports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "status"
    t.text "sub_khong_du_dieu_kiens_errors"
    t.bigint "mon_thi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "excel_file_name"
    t.string "excel_content_type"
    t.integer "excel_file_size"
    t.datetime "excel_updated_at"
    t.index ["mon_thi_id"], name: "index_khong_du_dieu_kiens_imports_on_mon_thi_id"
  end

  create_table "ky_this", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ten"
    t.string "nam_hoc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mon_this", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "ky_thi_id"
    t.bigint "hoc_phan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hoc_phan_id"], name: "index_mon_this_on_hoc_phan_id"
    t.index ["ky_thi_id"], name: "index_mon_this_on_ky_thi_id"
  end

  create_table "phong_mays", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ten"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sinh_viens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ten"
    t.date "ngay_sinh"
    t.string "khoa"
    t.string "lop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "password_confirmation"
    t.boolean "remember_me"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_sinh_viens_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sinh_viens_on_reset_password_token", unique: true
  end

  create_table "sinh_viens_imports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "excel_file_name"
    t.string "excel_content_type"
    t.integer "excel_file_size"
    t.datetime "excel_updated_at"
    t.integer "status"
    t.text "sub_sinh_viens_errors"
  end

  add_foreign_key "ca_this", "ky_this"
  add_foreign_key "ca_this", "mon_this"
  add_foreign_key "ca_this", "phong_mays"
  add_foreign_key "du_dieu_kiens", "mon_this"
  add_foreign_key "du_dieu_kiens", "sinh_viens"
  add_foreign_key "du_dieu_kiens_imports", "mon_this"
  add_foreign_key "khong_du_dieu_kiens", "mon_this"
  add_foreign_key "khong_du_dieu_kiens", "sinh_viens"
  add_foreign_key "khong_du_dieu_kiens_imports", "mon_this"
  add_foreign_key "mon_this", "hoc_phans"
  add_foreign_key "mon_this", "ky_this"
end
