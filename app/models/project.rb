class Project < ApplicationRecord
  has_many :tasks
  belongs_to :admin
  belongs_to :team
end
