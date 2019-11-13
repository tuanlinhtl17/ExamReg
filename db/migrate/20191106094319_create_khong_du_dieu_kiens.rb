class CreateKhongDuDieuKiens < ActiveRecord::Migration[5.2]
  def change
    create_table :khong_du_dieu_kiens do |t|
      t.references :mon_thi, foreign_key: true
      t.references :sinh_vien, foreign_key: true

      t.timestamps
    end
  end
end
