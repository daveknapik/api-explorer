class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.string :name
      t.string :description
      t.references :resource, index: true

      t.timestamps null: false
    end
    add_foreign_key :examples, :resources
  end
end
