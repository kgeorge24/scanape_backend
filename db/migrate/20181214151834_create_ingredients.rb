class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :title
      t.string :picture
      t.integer :quantity, default: 1

      
      t.timestamps
    end
  end
end
