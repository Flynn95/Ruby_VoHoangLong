class CreateBoards < ActiveRecord::Migration[8.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :creator_email
      t.integer :height
      t.integer :width
      t.integer :number_of_mines
      t.jsonb :data

      t.timestamps
    end
  end
end
