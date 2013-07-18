class IngredientsController < ApplicationController

	def list
		@ingredients = Ingredients.all
	end

	def new
		@ingredients=Ingredients.new       
	end

	def show
		@ingredients=Ingredients.find(params[:id])
	end

	def edit
		@ingredients=Ingredients.find(params[:id])
	end

	def delete
		@ingredients=Ingredients.find(params[:id])
	end
	
	def update
	    @ingredients=Ingredients.find(params[:id])	
	    if @ingredients.update_attributes(params[:ingredients].permit(:Name))
	    	redirect_to(:action => 'show',:id => @ingredients.id)
	    else
	    	render('edit')	
	    end	
	end    	


	def destroy
		 Ingredients.find(params[:id]).destroy
		 redirect_to(:action => 'list')
	end		 

	def create
		@ingredients=Ingredients.new(params[:ingredients].permit(:Name))
		if @ingredients.save
			redirect_to("/ingredients/list")
		else
		 	render('new')	
		end 	
	end	
end
