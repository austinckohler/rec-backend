class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :URL
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
