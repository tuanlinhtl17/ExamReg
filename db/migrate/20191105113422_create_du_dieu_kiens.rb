class CreateDuDieuKiens < ActiveRecord::Migration[5.2]
  def change
    create_table :du_dieu_kiens do |t|
      t.references :hoc_phan, foreign_key: true
      t.references :sinh_vien, foreign_key: true

      t.timestamps
    end
  end
end
