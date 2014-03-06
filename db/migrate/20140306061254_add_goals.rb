class AddGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :owner_id,      null: false
      t.string  :name,          null: false
      t.string  :reason,        null: false
      t.integer :critical_mass, null: false, default: 5

      t.timestamps
    end

    add_index :goals, :owner_id
    add_index :goals, :name
  end
end
