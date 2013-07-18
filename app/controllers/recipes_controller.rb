class RecipesController < ApplicationController

	def list
		@recipe_name = Recipes.all
	end

	def index
		#@ing = params[:ingredients].split(',')
		#@recipes=Recipes.new.get_recipes(@ing)
		#render :json => @recipes.to_json
	end	

	def give

	end

	def receive
		@ing=params[:ingredients].to_a.map{|i| i[1].delete(' ')}.join(" ").strip.split
		@recipes=Recipes.new.get_recipes(@ing)
		#render :json => @recipes.to_json
	end

	def new
		@recipes=Recipes.new
	end

	def show
		@recipes=Recipes.find(params[:id])
		render :json => @recipes.to_json(:include => ['recipe_ingredients'])

	end

	def edit
		@recipes=Recipes.find(params[:id])
	end

	def delete
		@recipes=Recipes.find(params[:id])
	end
	
	def update
	    @recipes=Recipes.find(params[:id])	
	    if @recipes.update_attributes(params[:recipes].permit(:Name,:Region,:Time_to_cook,:Type,:Ingredients_needed))
	    	redirect_to(:action => 'show',:id => @recipes.id)
	    else
	    	render('edit')	
	    end	
	end    	

	def create
		@recipes=Recipes.new(params[:recipes].permit(:Name,:Region,:Time_to_cook,:Type,:Ingredients_needed))
		if @recipes.save
			redirect_to("/recipes/list")
		else
		 	render('new')	
		end 		
	end	

	def destroy
		 Recipes.find(params[:id]).destroy
		 redirect_to(:action => 'list')
	end		 

	
end
