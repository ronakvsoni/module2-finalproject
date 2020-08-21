class Team < ApplicationRecord
  belongs_to :admin
  has_many :team_members