class AddSizeToShirt < ActiveRecord::Migration
  def change
    add_column :shirts, :size, :string
  end
end
