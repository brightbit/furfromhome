require 'active_support'

user = User.where(email: 'user@example.com').first || User.create!(email: 'user@example.com', password: "password", password_confirmation: 'password', admin: true)

File.readlines(File.realpath("../seeds/breed_names.tsv", __FILE__)).each do |line|
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
      record.breed_id = breed_id ||= Breed.create.id

    end
  end
end
