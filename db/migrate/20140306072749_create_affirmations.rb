class CreateAffirmations < ActiveRecord::Migration
  def change
    create_table :affirmations do |t|
      t.integer :affirmer_id, null: false
      t.integer :goal_id,     null: false
      t.string  :reason,      null: false

      t.timestamps
    end

    add_index :affirmations, %i(affirmer_id goal_id)
  end
end
