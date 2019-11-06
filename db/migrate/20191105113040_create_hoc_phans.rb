class CreateHocPhans < ActiveRecord::Migration[5.2]
  def change
    create_table :hoc_phans do |t|
      t.string :ten
      t.integer :so_tin_chi

      t.timestamps
    end
  end
end
