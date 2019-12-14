class CreateCaThiPhongMays < ActiveRecord::Migration[5.2]
  def change
    create_table :ca_thi_phong_mays do |t|
      t.references :ca_thi, foreign_key: true
      t.references :phong_may, foreign_key: true

      t.timestamps
    end
  end
end
