class CreateQuanTriViens < ActiveRecord::Migration[5.2]
  def change
    create_table :quan_tri_viens do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
