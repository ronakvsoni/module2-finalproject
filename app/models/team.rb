class Team < ApplicationRecord
  belongs_to :admin
  belongs_to :team_member
end
