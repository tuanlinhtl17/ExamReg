class AddExcelToDuDieuKiensImport < ActiveRecord::Migration[5.2]
  def up
    add_attachment :du_dieu_kiens_imports, :excel
  end

  def down
    remove_attachment :du_dieu_kiens_imports, :excel
  end
end
