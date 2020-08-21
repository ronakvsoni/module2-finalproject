class TeamMember < ApplicationRecord
<<<<<<< HEAD
    has_many :teams, dependent: :destroy
=======
    belongs_to :teams
>>>>>>> master
    
end
