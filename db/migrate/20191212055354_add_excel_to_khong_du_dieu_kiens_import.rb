class AddExcelToKhongDuDieuKiensImport < ActiveRecord::Migration[5.2]
  def up
    add_attachment :khong_du_dieu_kiens_imports, :excel
  end

  def down
    remove_attachment :khong_du_dieu_kiens_imports, :excel
  end
end
