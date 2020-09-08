class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies, id: :uuid do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :director
      t.integer :year

      t.timestamps
    end
  end
end
