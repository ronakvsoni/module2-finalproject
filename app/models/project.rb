class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :admin
  belongs_to :team
end
