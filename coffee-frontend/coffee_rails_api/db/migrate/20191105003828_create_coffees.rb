class CreateCoffees < ActiveRecord::Migration[6.0]
  def change
    create_table :coffees do |t|
      t.string :blend_name
      t.string :origin
      t.string :notes

      t.timestamps
    end
  end
end
