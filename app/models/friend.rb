class Friend < ApplicationRecord
    has_many :events
    has_many :user_friends
    has_many :users, :through => :user_friends

    validates_each :first_name, :last_name do |record, attr, value|
        record.errors.add(attr, "#{attr} can't be blank") if value.blank?
    end

    validate :at_least_one_identifier

    def at_least_one_identifier
        if phone.nil? && email.nil?
            errors.add(:base, "Must have a phone number or an email")
        end

    end


end