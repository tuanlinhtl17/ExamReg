class CreateCaThis < ActiveRecord::Migration[5.2]
  def change
    create_table :ca_this do |t|
      t.string :ten
      t.datetime :bat_dau
      t.datetime :ket_thuc
      t.date :ngay_thi
      t.references :ky_thi, foreign_key: true
      t.references :mon_thi, foreign_key: true

      t.timestamps
    end
  end
end
