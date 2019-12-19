class CreateMonThis < ActiveRecord::Migration[5.2]
  def change
    create_table :mon_this do |t|
      t.references :ky_thi, foreign_key: { on_delete: :cascade }
      t.references :hoc_phan, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
