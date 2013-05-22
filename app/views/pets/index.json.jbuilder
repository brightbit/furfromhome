json.array!(@pets) do |pet|
  json.extract! pet, :name, :color, :age, :weight, :markings, :gender, :collar, :collar_description, :chipped, :injured, :listing_type, :missing_since_found_at, :location, :latitude, :longitude, :description, :returned_to_owner, :scraping_script, :scraped_feed, :source_url, :breed_id, :user_id
  json.url pet_url(pet, format: :json)
end