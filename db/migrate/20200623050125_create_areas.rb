class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :RecAreaID
      t.string :RecAreaName
      t.text :RecAreaDescription
      t.integer :RecAreaLongitude
      t.integer :RecAreaLatitude
      t.string :LastUpdatedDate

      t.timestamps
    end
  end
end
