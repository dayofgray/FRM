class User < ApplicationRecord
    has_secure_password
    has_many :events
    has_many :user_friends
    has_many :friends, :through => :user_friends
    has_many :comments
    has_many :commented_events, :through => :comments, :source => :event
end
