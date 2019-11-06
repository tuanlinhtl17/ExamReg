class CreateCaThis < ActiveRecord::Migration[5.2]
  def change
    create_table :ca_this do |t|
      t.integer :ten
      t.datetime :bat_dau
      t.datetime :ket_thuc

      t.timestamps
    end
  end
end
