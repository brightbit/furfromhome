class Breed < ActiveRecord::Base
  has_many :names, class_name: 'BreedName'
  has_many :pets
end
