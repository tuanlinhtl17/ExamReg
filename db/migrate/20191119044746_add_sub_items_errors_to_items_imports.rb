class AddSubItemsErrorsToItemsImports < ActiveRecord::Migration[5.2]
  def change
    add_column :items_imports, :sub_items_errors, :text
  end
end
