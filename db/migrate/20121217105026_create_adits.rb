class CreateAdits < ActiveRecord::Migration
  def change
    create_table :adits do |t|
      t.string :name
      t.string :description
      t.string :owner

      t.timestamps
    end
  end
end
