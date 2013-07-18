class Ingredients < ActiveRecord::Base
	has_many :recipe_ingredients # => defines an instance method called ingredients_recipes
	has_many :recipes, :through => :recipe_ingredients # => defines an instance method called recipes
end
