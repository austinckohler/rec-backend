class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :areaID
      t.string :name
      t.text :description
      t.text :directions
      t.string :phone
      t.text :email
      t.float :long
      t.float :lat
      t.string :lastUpdated
      # t.string :facilityID
      # t.string :facilityName
      # t.string :activityID
      # t.string :recAreaActivityID
      # t.string :linkAreaID
      # t.string :linkTitle
      # t.string :linkURL
      # t.string :mediaAreaID
      # t.string :mediaURL

      t.timestamps
    end
  end
end
