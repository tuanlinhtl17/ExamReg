class AddTrangThaiToSinhViensImports < ActiveRecord::Migration[5.2]
  def change
    add_column :sinh_viens_imports, :status, :integer
  end
end
