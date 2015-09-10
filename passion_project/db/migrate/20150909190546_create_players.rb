class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :team
      t.integer :games
      t.integer :minutes
      t.integer :field_goals_percentage
      t.string :position
      t.integer :three_pointers_percentage
      t.integer :free_throws_percentage
      t.integer :rebounds
      t.integer :assists
      t.integer :steals
      t.integer :blocked_shots
      t.integer :turnovers
      t.integer :points
      t.integer :pool_id
      #include pic of player?

      t.timestamps
    end
  end
end
