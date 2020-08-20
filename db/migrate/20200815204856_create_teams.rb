class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :admin, null: false, foreign_key: true
      t.references :team_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
