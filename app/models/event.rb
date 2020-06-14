class Event < ApplicationRecord
    belongs_to :user
    belongs_to :friend
    has_many :comments
    has_many :commenting_users, through: :comments, source: :user

end