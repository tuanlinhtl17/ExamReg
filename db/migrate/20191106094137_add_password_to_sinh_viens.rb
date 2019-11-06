class AddPasswordToSinhViens < ActiveRecord::Migration[5.2]
  def change
    add_column :sinh_viens, :password, :string
  end
end
