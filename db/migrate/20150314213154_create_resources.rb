class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :path
      t.string :http_method
      t.references :api_call, index: true

      t.timestamps null: false
    end
    add_foreign_key :resources, :api_calls
  end
end
