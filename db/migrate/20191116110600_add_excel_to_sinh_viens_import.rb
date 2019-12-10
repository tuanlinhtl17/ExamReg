class AddExcelToSinhViensImport < ActiveRecord::Migration[5.2]
  def up
    add_attachment :sinh_viens_imports, :excel
  end

  def down
    remove_attachment :sinh_viens_imports, :excel
  end
end
