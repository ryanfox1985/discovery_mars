class CreateLands < ActiveRecord::Migration
  def change
    create_table :lands do |t|
      t.integer :x
      t.integer :y
    end
  end
end
