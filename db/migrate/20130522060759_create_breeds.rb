class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :species
      t.string :description
      t.string :url
      t.string :photo_url

      t.timestamps
    end
  end
end
