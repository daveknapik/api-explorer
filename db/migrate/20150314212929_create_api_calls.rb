class CreateApiCalls < ActiveRecord::Migration
  def change
    create_table :api_calls do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
