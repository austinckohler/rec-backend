class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.string :name
      t.text :description
      t.text :directions
      t.float :long
      t.float :lat
      t.string :lastUpdated

      t.timestamps
    end
  end
end
