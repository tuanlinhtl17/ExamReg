class CreateDuDieuKiensImports < ActiveRecord::Migration[5.2]
  def change
    create_table :du_dieu_kiens_imports do |t|
      t.integer :status
      t.text :sub_du_dieu_kiens_errors
      t.references :mon_thi, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
