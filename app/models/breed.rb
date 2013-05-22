class Breed < ActiveRecord::Base
  has_many :names, class_name: 'BreedName'
  has_many :pets

  def name
    names.first.name
  end

  def to_s
    name
  end
end
