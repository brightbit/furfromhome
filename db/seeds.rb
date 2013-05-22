require 'active_support'

admin = User.where(email: 'admin@example.com').first || User.create!(email: 'admin@example.com', password: "password", password_confirmation: 'password')
admin.add_role "admin"
user  = User.where(email: 'user@example.com' ).first || User.create!(email: 'user@example.com',  password: "password", password_confirmation: 'password')

def import_breed_names(species)
  File.readlines(File.realpath("../seeds/#{species}_breed_names.tsv", __FILE__)).each do |line|
    names = line.chomp.split("\t").map do |n|
      {
        name: n,
        simplified_name: ActiveSupport::Inflector.transliterate(n).downcase
      }
    end

    breed_id = nil

    names.each do |name|
      BreedName.where(
        simplified_name: name[:simplified_name]
      ).first_or_create do |record|
        record.name = name[:name]

        name[:record] = record

        if breed_id
          record.breed_id = breed_id
        else record.breed_id
          breed_id = record.breed_id ||= Breed.create(species: species).id
        end
      end
    end
  end
end

import_breed_names('dog')
import_breed_names('cat')
