class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title

      t.timestamps
    end

    create_table :categories_stories do |t|
    	t.belongs_to :category, index: true 
    	t.belongs_to :story, index: true
    end

  end
end
