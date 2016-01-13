class Story < ActiveRecord::Base
  validates :title, :link, :upvotes, presence: true

  has_many :comments
  has_and_belongs_to_many :categories

  def self.search_for(query)
    where('title LIKE :query OR category LIKE :query', query: "%#{query}%")
  end
end
