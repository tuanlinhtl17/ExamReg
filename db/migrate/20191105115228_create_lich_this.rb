class CreateLichThis < ActiveRecord::Migration[5.2]
  def change
    create_table :lich_this do |t|
      t.references :ca_thi, foreign_key: true
      t.references :phong_may, foreign_key: true
      t.references :mon_thi, foreign_key: true

      t.timestamps
    end
  end
end
