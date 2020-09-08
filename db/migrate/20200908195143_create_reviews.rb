class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews, id: :uuid do |t|
      t.string :name
      t.text :review
      t.integer :stars
      t.belongs_to :movie, type: :uuid, index: true, null: false, foreign_key: true
      t.belongs_to :reviewer,type: :uuid, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
