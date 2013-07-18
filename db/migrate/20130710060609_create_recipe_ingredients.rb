class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
    	t.belongs_to :recipes
      t.belongs_to :ingredients
    	t.string "Name"
    	t.integer "Amount_needed"
    	t.integer "Priority"

      t.timestamps
    end
  end
end
