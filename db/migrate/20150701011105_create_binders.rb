class CreateBinders < ActiveRecord::Migration
  def change
    create_table :binders do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.string :export_path

      t.timestamps null: false
    end
  end
end
