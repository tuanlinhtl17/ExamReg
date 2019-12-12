class CreateKhongDuDieuKiensImport < ActiveRecord::Migration[5.2]
  def change
    create_table :khong_du_dieu_kiens_imports do |t|
      t.integer :status
      t.text :sub_khong_du_dieu_kiens_errors
      t.references :mon_thi, foreign_key: true

      t.timestamps
    end
  end
end
