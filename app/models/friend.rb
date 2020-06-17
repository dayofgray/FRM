class Friend < ApplicationRecord
    has_many :events, :dependent => :delete_all
    has_many :user_friends, :dependent => :delete_all
    has_many :users, :through => :user_friends
    validates_presence_of :first_name, :last_name, :birthday_month, :birthday_day
    validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, :allow_nil => true, message: "is invalid"
    validates_format_of :phone, :with => /\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/, :allow_nil => true

    validates_each :first_name, :last_name, :birthday_month, :birthday_day do |record, attr, value|
        record.errors.add(attr, "#{attr} can't be blank") if value.blank?
    end

    validate :at_least_one_identifier

    validates :birthday_month, inclusion: {in: %w(January February March April May June July August September October November December), message: "Must be a valid month"}

    validates :birthday_day, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 31, :message => "can only be number between 1 and 31." }


    def at_least_one_identifier
        if phone.nil? && email.nil?
            errors.add(:base, "Must have a phone number or an email")
        end

    end

    def full_name
        first_name + " " + last_name
    end

    def birthday
        "#{birthday_month} #{birthday_day}"
    end

end