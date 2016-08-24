class CreateJoinTableActorsMovies < ActiveRecord::Migration
  def change
  	create_table :actors_movies, :id => false do |t|
  	t.references :actor, index: true
  	t.references :movie, index: true
	end

	end	
end
