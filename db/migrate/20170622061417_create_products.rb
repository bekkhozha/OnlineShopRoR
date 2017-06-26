class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :category_id
      t.integer :discount, default: 0
      t.boolean :available, default:true

      t.timestamps
    end
  end
end
