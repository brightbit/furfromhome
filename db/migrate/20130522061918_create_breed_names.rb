class CreateBreedNames < ActiveRecord::Migration
  def change
    create_table :breed_names do |t|
      t.string :name
      t.string :simplified_name
      t.references :breed, index: true

      t.timestamps
    end
  end
end
