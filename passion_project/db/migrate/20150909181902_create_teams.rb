class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.references :draft, index: true, foreign_key: true
      t.integer :draft_position

      t.timestamps null: false
    end
  end
end
