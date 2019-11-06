class CreateKyThis < ActiveRecord::Migration[5.2]
  def change
    create_table :ky_this do |t|
      t.string :ten
      t.integer :nam_hoc

      t.timestamps
    end
  end
end
