class TeamMember < ApplicationRecord
    has_many :teams, dependent: :destroy
    
end
