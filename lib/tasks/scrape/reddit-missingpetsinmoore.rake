namespace :scrape do
  PET_ATTRIBUTES = %I[
    name color age weight markings gender collar source_url photo_url injured
    listing_type missing_since_found_at location latitude longitude description
    returned_to_owner scraping_script scraped_feed
  ]

  desc "reddit_missingpetsinmoore"
  task :reddit_missingpetsinmoore => :environment do
    require 'snoo'

    reddit = Snoo::Client.new

    data = reddit.get_listing(subreddit: 'missingpetsinmoore', limit: 100)
    comments = data['data']['children'].map { |c| c['data'] }

    def self.photo_url
      case @listing['url']
      when %r{^http://www.reddit.com/r/missingpetsinmoore/}
        nil
      when %r{^http://imgur.com/\w+$}
        @listing['url'] + '.jpg'
      else
        @listing['url']
      end
    end

    def self.listing_type
      case @listing['title']
      when /^\[?FOUND/i
        'found'
      when /^\[?MISSING/i
        'lost'
      end
    end

    def self.breed
      name = description.andand.split(/ *named */i).andand[0]
    end

    def self.name
      name = description.andand.split(/ *named */i).andand[1]
    end

    def self.source_url
      "http://www.reddit.com#{@listing['permalink']}"
    end

    def self.missing_since_found_at
      Time.at(@listing['created']).utc + Time.now.utc_offset
    end

    def self.location;    'Moore, OK'; end

    def self.latitude;      35.334957; end

    def self.longitude;    -97.475459; end

    def self.returned_to_owner; false; end

    def self.description
      @listing['title'][/\[?(LOST|FOUND)\]?\s*(.+)/, 2]
    end

    def self.scraping_script
      'reddit_missingpetsinmoore'
    end

    def self.scraped_feed
      'http://www.reddit.com/r/missingpetsinmoore'
    end

    comments.each do |c|
      @listing = c

      next unless listing_type

      pet = Pet.where(source_url: source_url).first_or_create do |pet|
        PET_ATTRIBUTES.each do |attr|
          pet.send("#{attr}=", send(attr)) if respond_to?(attr)
        end

        if breed
          pet.breed_id = BreedName.where(simplified_name: breed.downcase).first.andand.breed_id
        end

        pet.save(validate: false)
      end
    end
  end
end
