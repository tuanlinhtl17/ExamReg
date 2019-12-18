class CreatePhongMays < ActiveRecord::Migration[5.2]
  def change
    create_table :phong_mays do |t|
      t.string :ten
      t.integer :so_may
      t.integer :so_may_trong

      t.timestamps
    end
  end
end
