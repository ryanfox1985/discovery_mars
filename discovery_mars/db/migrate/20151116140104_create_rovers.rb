class CreateRovers < ActiveRecord::Migration
  def change
    create_table :rovers do |t|
      t.integer :x
      t.integer :y
      t.string :way
      t.references :land, index: true, foreign_key: true
    end
  end
end
