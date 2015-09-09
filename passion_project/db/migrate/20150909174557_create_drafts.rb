class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.integer :current_team
      t.integer :num_teams
      t.references :user, index: true, foreign_key: true
      t.references :pool, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
