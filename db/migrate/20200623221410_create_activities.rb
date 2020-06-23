class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.references :area
      t.string :name
      t.string :description
      t.string :areaid

      t.timestamps
    end
  end
end
