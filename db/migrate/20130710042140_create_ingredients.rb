class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
    	t.string "Name"

      t.timestamps
    end
  end
end
