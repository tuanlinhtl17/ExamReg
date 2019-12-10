class AddSubSinhViensErrorsToSinhViensImports < ActiveRecord::Migration[5.2]
  def change
    add_column :sinh_viens_imports, :sub_sinh_viens_errors, :text
  end
end
