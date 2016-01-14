class AddColumnsToMovie < ActiveRecord::Migration
  def change
  	add_reference :movies, :genre, index: true

  	 create_table :actors_movies do |t|
    	t.belongs_to :actor, index: true
    	t.belongs_to :movie, index: true
    end
  end
end
