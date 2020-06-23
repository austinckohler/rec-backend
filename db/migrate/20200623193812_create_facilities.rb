class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.string :facilityID
      t.string :recAreaID
    t.string :name
    t.text :description
    t.text :directions
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
