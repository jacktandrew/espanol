class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :category
      t.integer :size
      t.integer :level
      t.integer :matchless

      t.timestamps
    end
  end
end
