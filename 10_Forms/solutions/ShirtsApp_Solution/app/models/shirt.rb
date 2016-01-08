class Shirt < ActiveRecord::Base
  validates :name, :description, :image, presence: true
  validates :description, length: { minimum: 10 }
  validates :image, format: /\A\w+\.png\z/

  def self.search_for(query)
  	#where replaces :query in the querystring with the value of the second argument (keyed ":query")
  	#always use this replacement, never allow query parameters to be executed on the database directly, it's a sercurity risk
  	#LIKE in SQL uses pattern matching (= searches for exact matches only)
  	#% is a wildcard so you can search for names or descriptions that contain the search term (as opposed to equalling exactly or starting/ending with it)
  	#The rest is your familiar old ruby string interpolation "#{query}"
	Shirt.where('name LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
end
