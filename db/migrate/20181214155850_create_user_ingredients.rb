class CreateUserIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :user_ingredients do |t|
      t.string :user_id
      t.string :ingredient_id

      
      t.timestamps
    end
  end
end
