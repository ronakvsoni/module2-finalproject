class Admin < ApplicationRecord
    has_many :teams , dependent: :destroy
    has_many :projects
    validates :username, presence: true, uniqueness: true
    validates :password_confirmation, presence: true
    validates :password, presence: true
    
    has_secure_password
    
end
