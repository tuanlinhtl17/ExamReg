class AddTrangThaiToItemsImports < ActiveRecord::Migration[5.2]
  def change
    add_column :items_imports, :status, :integer
  end
end
