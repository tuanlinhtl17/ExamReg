class CreateDangKies < ActiveRecord::Migration[5.2]
  def change
    create_table :dang_kies do |t|
      t.references :sinh_vien, foreign_key: { on_delete: :cascade }
      t.references :ca_thi_phong_may, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
