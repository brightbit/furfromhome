class Pet < ActiveRecord::Base
  COLORS = %w[brown white black] #TODO: Add more colors
  # Assocations
  resourcify
  include Authority::Abilities
  belongs_to :author, class_name: 'User'
  belongs_to :breed
  belongs_to :user
  geocoded_by :location

  # Scopes
  scope :has_location,  -> { where "location IS NOT NULL" }
  scope :has_photo,     -> { where "photo_url IS NOT NULL" }
  scope :unreturned,    -> { where returned_to_owner: false }
  scope :listing_type,  -> ltype    { where listing_type: ltype }
  scope :breed_id,      -> breed_id { where breed_id: breed_id }
  scope :animal,        -> species  { where cached_species: species.downcase }
  scope :color,         -> color    { where color: color }
  scope :gender,        -> gender   { where gender: gender }
  scope :missing_since, -> day      { where "missing_since_found_at > ?", day }
  scope :source,        -> source   { where scraping_script: source }

  # Validations
  validates :location, presence: true
  validates :listing_type, inclusion: { in: ['lost', 'found'] }
  validates :gender, inclusion: { in: ['male', 'female'] }

  # Callbacks
  after_validation :geocode, if: :location_changed?
  before_save :cache_species

  # Methods
  def to_s
    name || breed || 'Pet'
  end

  private

  def cache_species
    self.cached_species = breed.species if breed
  end
end
