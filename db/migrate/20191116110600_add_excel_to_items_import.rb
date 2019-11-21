class AddExcelToItemsImport < ActiveRecord::Migration[5.2]
  def up
    add_attachment :items_imports, :excel
  end

  def down
    remove_attachment :items_imports, :excel
  end
end
