class Shirt < ActiveRecord::Base
	validates :name, :description, :image, presence: true
	validates :description, length: { minimum: 10 }
 	validates :image, format: /\A\w+\.png\z/

  def self.search_for(query)
  	self.where("name LIKE :q OR description LIKE :q", q: "%#{query}%")
  end
end
