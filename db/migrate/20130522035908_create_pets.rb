class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :color
      t.integer :age
      t.integer :weight
      t.string :markings
      t.string :gender
      t.boolean :collar
      t.string :collar_description
      t.boolean :chipped
      t.boolean :injured
      t.string :listing_type
      t.datetime :missing_since_found_at
      t.string :location
      t.float :latitude
      t.float :longitude
      t.text :description
      t.boolean :returned_to_owner, default: false
      t.string :scraping_script
      t.string :scraped_feed
      t.string :source_url
      t.string :photo_url
      t.references :breed, index: true
      t.references :user, index: true
      t.integer :author_id, index: true

      t.timestamps
    end
  end
end
