class RemovePicFromCards < ActiveRecord::Migration
  def up
    remove_column :cards, :pic    
  end

  def down
    add_column :cards, :pic, :string
  end
end
