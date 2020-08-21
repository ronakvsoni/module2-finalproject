class TeamMember < ApplicationRecord
    belongs_to :teams, optional :true
end
