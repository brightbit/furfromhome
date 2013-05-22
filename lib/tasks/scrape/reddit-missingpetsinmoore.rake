namespace :scrape do
  desc "reddit_missingpetsinmoore"
  task :reddit_missingpetsinmoore => :environment do
    require 'snoo'

    reddit = Snoo::Client.new

    data = reddit.get_listing(subreddit: 'missingpetsinmoore', limit: 100)
    comments = data['data']['children'].map { |c| c['data'] }

    comments.each do |c|
      listing_type = case c['title']
                     when /^\[?FOUND/i
                       'found'
                     when /^\[?MISSING/i
                       'lost'
                     end

      next unless listing_type

      Pet.where(source_url: "http://www.reddit.com#{c['permalink']}").first_or_create do |pet|
        breed = c['title'][/\[?(LOST|FOUND)\]?\s*(.+)/, 2]
        breed, name = breed.andand.split(/ *named */i)

        pet.name = name
        # color:
        # age:
        # weight:
        # markings:
        # gender:
        # collar:
        pet.photo_url = "#{c['url']}"
        # injured:
        pet.listing_type = listing_type
        # missing_since_found_at:
        pet.location = 'Moore, OK'
        pet.latitude = 35.334957
        pet.longitude = -97.475459
        pet.description = breed
        pet.returned_to_owner = false
        pet.scraping_script = 'reddit_missingpetsinmoore'
        pet.scraped_feed = 'http://www.reddit.com/r/missingpetsinmoore'
        pet.source_url = "http://www.reddit.com#{c['permalink']}"
        # breed_id:
        # user:

        if breed
          pet.breed_id = BreedName.where(simplified_name: breed.downcase).first.andand.breed_id
        end
      end
    end
  end
end
