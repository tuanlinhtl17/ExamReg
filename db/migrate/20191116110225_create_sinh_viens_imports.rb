class CreateSinhViensImports < ActiveRecord::Migration[5.2]
  def change
    create_table :sinh_viens_imports do |t|

      t.timestamps
    end
  end
end
