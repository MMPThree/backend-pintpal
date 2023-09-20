class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :city
      t.string :state
      t.text :review_text
      t.integer :rating

      t.timestamps
    end
  end
end
