class CreateScans < ActiveRecord::Migration[5.2]
  def change
    create_table :scans do |t|
      t.string :barcode
      t.string :user_id
      
      t.timestamps
    end
  end
end
