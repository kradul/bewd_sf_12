class Shirt < ActiveRecord::Base
  #validates :image, format: /\A\w+\.png\z/


 def self.search_for(query)
    Shirt.where('name LIKE :query OR description LIKE :query', query: "%#{query}%")
  end


end
