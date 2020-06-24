class CreatePublishes < ActiveRecord::Migration[6.0]
  def change
    create_table :publishes do |t|
      t.string :title
      t.string :URL
      t.string :areaid
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
