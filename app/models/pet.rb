class Pet < ActiveRecord::Base
  # Assocations
  belongs_to :breed
  belongs_to :user
  geocoded_by :location

  # Validations
  validates :location, presence: true
  validates :listing_type, inclusion: { in: ['lost', 'found'] }
  validates :gender, inclusion: { in: ['male', 'female'] }

  # Callbacks
  after_validation :geocode, if: :location_changed?

  # Methods
  def to_s
    name || breed || 'Pet'
  end
end
