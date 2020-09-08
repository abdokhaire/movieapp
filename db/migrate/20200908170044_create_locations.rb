class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations, id: :uuid do |t|
      t.string :name
      t.string :country
      t.belongs_to :movie, type: :uuid, index: true, null: false, foreign_key: true
      t.belongs_to :actor, type: :uuid, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
