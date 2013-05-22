class BreedName < ActiveRecord::Base
  belongs_to :breed

  def to_s
    name
  end
end
