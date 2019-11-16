class AddPasswordConfirmationToSinhViens < ActiveRecord::Migration[5.2]
  def change
    add_column :sinh_viens, :password_confirmation, :string
  end
end
