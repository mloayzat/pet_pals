class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :description
      t.string :phone
      t.string :address
      t.string :name
      t.string :category
      t.string :image
      t.integer :user_id

      t.timestamps

    end
  end
end
