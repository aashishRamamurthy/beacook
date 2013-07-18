class Recipes < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, :through => :recipe_ingredients

	
	scope :all_names_ASC , -> {select("Name").order("Name ASC").to_a}
	scope :names ,-> {select("Name")}
	scope :recipe_id ,-> {select("id")}
	
	def get_recipes(ingredients)
		ing=Recipes.find_by_sql("Select r.* from Recipes r")
		@recipes={}
		if ingredients.any?
			ing_set=Set.new(ingredients)
			ing.each do |i|
				array_ing=Set.new((i.Ingredients_needed).split)
     			if ing_set.subset?(array_ing)
     				@recipes[i.id]={:Name => i.Name,:Time => i.Time_to_cook,:Type => i.Type}
				end
			end	
		end		
 	return @recipes
	end

    
end
