class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :titel
      t.string :notice

      t.timestamps
    end
  end
end
