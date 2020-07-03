class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :areaID
      t.string :name
      t.text :description
      t.text :directions
      t.string :phone
      t.text :email
      t.text :map
      t.float :long
      t.float :lat
      t.string :lastUpdated

      t.timestamps
    end
  end
end
