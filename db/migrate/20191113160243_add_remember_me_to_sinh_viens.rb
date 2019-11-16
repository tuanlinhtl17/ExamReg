class AddRememberMeToSinhViens < ActiveRecord::Migration[5.2]
  def change
    add_column :sinh_viens, :remember_me, :boolean
  end
end
