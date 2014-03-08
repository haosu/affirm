class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :owner_id, null: false
      t.integer :goal_id,  null: false
      t.text    :content,  null: false

      t.timestamps
    end
  end
end
