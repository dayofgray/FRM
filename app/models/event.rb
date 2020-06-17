class Event < ApplicationRecord
    belongs_to :user
    belongs_to :friend
    has_many :comments, :dependent => :delete_all
    has_many :commenting_users, through: :comments, source: :user

    validates_presence_of :title, :location, :event_time
    validates :title, length: {maximum: 20}

    def readable_time
        event_time.strftime("%A, %d %b %Y %l:%M %p")
    end
end