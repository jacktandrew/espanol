class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :es
      t.string :en
      t.string :pic
      t.string :category
      t.integer :level

      t.timestamps
    end
  end
end
