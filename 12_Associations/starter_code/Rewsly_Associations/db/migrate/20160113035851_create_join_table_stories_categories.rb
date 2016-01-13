class CreateJoinTableStoriesCategories < ActiveRecord::Migration
  def change
  	create_join_table :stories, :categories
  end
end
