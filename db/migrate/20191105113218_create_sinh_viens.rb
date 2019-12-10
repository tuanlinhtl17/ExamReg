class CreateSinhViens < ActiveRecord::Migration[5.2]
  def change
    create_table :sinh_viens do |t|
      t.string :ten
      t.date :ngay_sinh
      t.string :khoa
      t.string :lop

      t.timestamps
    end
  end
end
