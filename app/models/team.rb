class Team < ApplicationRecord
  belongs_to :admin, dependent: :destroy
  belongs_to :team_member
  validates :name, presence: true

  
end
