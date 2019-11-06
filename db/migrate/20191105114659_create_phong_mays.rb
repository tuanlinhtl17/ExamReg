class CreatePhongMays < ActiveRecord::Migration[5.2]
  def change
    create_table :phong_mays do |t|
      t.string :ten

      t.timestamps
    end
  end
end
