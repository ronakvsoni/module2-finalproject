class TeamMember < ApplicationRecord
belongs_to :teams, dependent: :destroy, optional :true
    
end
