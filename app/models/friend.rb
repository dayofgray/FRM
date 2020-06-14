class Friend < ApplicationRecord
    has_many :events
    has_many :user_friends
    has_many :users, :through => :user_friends
end