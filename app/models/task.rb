class Task < ApplicationRecord
  belongs_to :project, dependent: :destroy
  belongs_to :team_member
end
