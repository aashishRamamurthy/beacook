class RecipeIngredientsController < ApplicationController

	def list
		@RecipeIngredients = RecipeIngredients.all
	end

	def new
		@RecipeIngredients=RecipeIngredients.new      
	end

	def show
		@RecipeIngredients=RecipeIngredients.find(params[:id])
	end

	def edit
		@RecipeIngredients=RecipeIngredients.find(params[:id])
	end

	def delete
		@RecipeIngredients=RecipeIngredients.find(params[:id])
	end
	
	def update
	    @RecipeIngredients=RecipeIngredients.find(params[:id])	
	    if @RecipeIngredients.update_attributes(params[:recipe_ingredients ].permit(:Name))
	    	redirect_to(:action => 'show',:id => @RecipeIngredients.id)
	    else
	    	render('edit')	
	    end	
	end    	


	def destroy
		 RecipeIngredients.find(params[:id]).destroy
		 redirect_to(:action => 'list')
	end		 

	def create
		@RecipeIngredients=RecipeIngredients.new(params[:recipe_ingredients ].permit(:Name))
		if @RecipeIngredients.save
			redirect_to("/recipe_ingredients/list")
		else
		 	render('new')	
		end 	
	end	
end
