class CreateTeamMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :email
      t.string :position

      t.timestamps
    end
  end
end
