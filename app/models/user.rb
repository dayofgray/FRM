class User < ApplicationRecord
    has_secure_password
    has_many :events
    has_many :user_friends
    has_many :friends, :through => :user_friends
    has_many :comments
    has_many :commented_events, :through => :comments, :source => :event

    validates_each :first_name, :last_name, :email do |record, attr, value|
        record.errors.add(attr, "#{attr} can't be blank") if value.blank?
    end

    def full_name
        first_name + " " + last_name
    end
end
