class Comment < ActiveRecord::Base
	belongs_to :story # not stories
end
