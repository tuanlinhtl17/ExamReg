class CreateDuDieuKiens < ActiveRecord::Migration[5.2]
  def change
    create_table :du_dieu_kiens do |t|
      t.references :mon_thi, foreign_key: { on_delete: :cascade }
      t.references :sinh_vien, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
