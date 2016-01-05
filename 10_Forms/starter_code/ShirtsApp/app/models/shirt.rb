class Shirt < ActiveRecord::Base
  #validates :image, format: /\A\w+\.png\z/

  def self.search_for(query)
  end
end
