class Team < ApplicationRecord
  belongs_to :admin, dependent: :destroy
  belongs_to :team_member
end
