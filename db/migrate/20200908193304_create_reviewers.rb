class CreateReviewers < ActiveRecord::Migration[6.0]
  def change
    create_table :reviewers, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
