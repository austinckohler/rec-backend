class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :areaID
      t.string :name
      t.text :description
      t.text :directions
      t.string :phone
      t.text :email
      t.integer :long
      t.integer :lat
      t.string :lastUpdated
      # t.string :facilityid
      # t.string :activity
      # t.string :activityDescription
      # t.string :linkURL
      # t.string :mediaTitle
      # t.string :mediaDescription
      # t.string :media

      t.timestamps
    end
  end
end
