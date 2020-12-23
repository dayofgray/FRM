class User < ApplicationRecord
    has_secure_password
    has_many :events, :dependent => :delete_all
    has_many :user_friends, :dependent => :delete_all
    has_many :friends, :through => :user_friends
    has_many :comments, :dependent => :delete_all
    has_many :commented_events, :through => :comments, :source => :event

    validates_presence_of :first_name, :last_name, :email
    validates :email, uniqueness: true

    validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "is invalid"

    def full_name
        first_name + " " + last_name
    end
 
    def upcoming_birthdays
      self.friends.birthdays_future
    end
end
