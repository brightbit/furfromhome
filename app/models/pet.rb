class Pet < ActiveRecord::Base
  # Assocations
  belongs_to :breed
  belongs_to :user
  geocoded_by :location

  # Validations
  validate :location, presense: true
  validate :listing_type, in: [:lost, :found]

  # Callbacks
  after_validation :geocode, if: :location_changed?

  # Methods
  def to_s
    name || breed || 'Pet'
  end
end
