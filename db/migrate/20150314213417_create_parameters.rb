class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :name
      t.string :description
      t.string :parameter_type
      t.boolean :required
      t.boolean :url_parameter
      t.references :resource, index: true

      t.timestamps null: false
    end
    add_foreign_key :parameters, :resources
  end
end
