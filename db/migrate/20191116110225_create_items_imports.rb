class CreateItemsImports < ActiveRecord::Migration[5.2]
  def change
    create_table :items_imports do |t|

      t.timestamps
    end
  end
end
