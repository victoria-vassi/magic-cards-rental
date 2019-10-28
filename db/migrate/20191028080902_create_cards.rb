class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :color
      t.string :type
      t.string :cmc
      t.string :power
      t.string :toughness
      t.string :img_url
      t.integer :price_per_week
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
