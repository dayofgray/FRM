class Event < ApplicationRecord
    belongs_to :user
    belongs_to :friend
    has_many :comments
    has_many :commenting_users, through: :comments, source: :user

    validates_each :title, :location, :event_time do |record, attr, value|
        record.errors.add(attr, "#{attr} can't be blank") if value.blank?
    end
    validates :title, length: {maximum: 20}
end