class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string "Name"
    	t.string "Type"
    	t.integer "Time_to_cook"
    	t.string "Region"
    	t.string "Ingredients_needed"


      t.timestamps
    end
  end
end
