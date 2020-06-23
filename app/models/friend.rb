class Friend < ApplicationRecord
    has_many :events, :dependent => :delete_all
    has_many :user_friends, :dependent => :delete_all
    has_many :users, :through => :user_friends
    validates_presence_of :first_name, :last_name, :birthday_month, :birthday_day
    validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "is invalid"
    validates_format_of :phone, :with => /\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/

    validates :birthday_month, inclusion: {in: %w(January February March April May June July August September October November December), message: "Must be a valid month"}

    validates :birthday_day, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 31, :message => "can only be number between 1 and 31." }
    scope :birthdays_soon, -> {where(birthday_month: Date::MONTHNAMES[Date.today.month])}
    scope :birthdays_future, -> {birthdays_soon.where("birthday_day >= ?", Date.today.day)}

    def full_name
        first_name + " " + last_name
    end

    def birthday
        "#{birthday_month} #{birthday_day}"
    end

end