class CreateKyThis < ActiveRecord::Migration[5.2]
  def change
    create_table :ky_this do |t|
      t.string :ten
      t.string :nam_hoc
      t.date :bat_dau_dang_ky
      t.date :ket_thuc_dang_ky

      t.timestamps
    end
  end
end
