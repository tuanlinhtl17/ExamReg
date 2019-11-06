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

ActiveRecord::Schema.define(version: 2019_11_06_094317) do

  create_table "ca_this", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "ten"
    t.datetime "bat_dau"
    t.datetime "ket_thuc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "du_dieu_kiens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "hoc_phan_id"
    t.bigint "sinh_vien_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hoc_phan_id"], name: "index_du_dieu_kiens_on_hoc_phan_id"
    t.index ["sinh_vien_id"], name: "index_du_dieu_kiens_on_sinh_vien_id"
  end

  create_table "hoc_phans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ten"
    t.integer "so_tin_chi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "khong_du_dieu_kiens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "hoc_phan_id"
    t.bigint "sinh_vien_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hoc_phan_id"], name: "index_khong_du_dieu_kiens_on_hoc_phan_id"
    t.index ["sinh_vien_id"], name: "index_khong_du_dieu_kiens_on_sinh_vien_id"
  end

  create_table "ky_this", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ten"
    t.integer "nam_hoc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lich_this", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "ca_thi_id"
    t.bigint "phong_may_id"
    t.bigint "mon_thi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ca_thi_id"], name: "index_lich_this_on_ca_thi_id"
    t.index ["mon_thi_id"], name: "index_lich_this_on_mon_thi_id"
    t.index ["phong_may_id"], name: "index_lich_this_on_phong_may_id"
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

  create_table "quan_tri_viens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sinh_viens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ten"
    t.integer "ma_sv"
    t.date "ngay_sinh"
    t.string "khoa"
    t.string "lop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
  end

  add_foreign_key "du_dieu_kiens", "hoc_phans"
  add_foreign_key "du_dieu_kiens", "sinh_viens"
  add_foreign_key "khong_du_dieu_kiens", "hoc_phans"
  add_foreign_key "khong_du_dieu_kiens", "sinh_viens"
  add_foreign_key "lich_this", "ca_this"
  add_foreign_key "lich_this", "mon_this"
  add_foreign_key "lich_this", "phong_mays"
  add_foreign_key "mon_this", "hoc_phans"
  add_foreign_key "mon_this", "ky_this"
end
