class CreateLands < ActiveRecord::Migration
  def change
    create_table :lands do |t|
      t.integer :x
      t.integer :y

      t.timestamps null: false
    end
  end
end
