class CreateDuDieuKiensImports < ActiveRecord::Migration[5.2]
  def change
    create_table :du_dieu_kiens_imports do |t|
      t.integer :status
      t.text :sub_du_dieu_kiens_errors
    end
  end
end
