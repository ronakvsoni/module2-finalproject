class Admin < ApplicationRecord
    has_many :teams 
    has_many :projects
end
