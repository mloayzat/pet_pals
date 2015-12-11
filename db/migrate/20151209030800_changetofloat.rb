class Changetofloat < ActiveRecord::Migration
  def change
 	change_column :ratings,  :average_rating, :float

  end
end
