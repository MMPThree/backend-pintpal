class CreateBeers < ActiveRecord::Migration[7.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.float :abv
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
