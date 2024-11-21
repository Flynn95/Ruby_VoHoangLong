class CreateBoards < ActiveRecord::Migration[8.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :creator_email
      t.integer :rows_count
      t.integer :columns_count
      t.integer :mines_count
      t.jsonb :data

      t.timestamps
    end
  end
end
