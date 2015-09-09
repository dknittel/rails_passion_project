class CreateDraftees < ActiveRecord::Migration
  def change
    create_table :draftees do |t|
      t.references :team, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true
      t.references :draft, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
