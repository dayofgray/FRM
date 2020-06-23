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

    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |user|
          user.first_name = auth.info.name.split(" ")[0]
          user.last_name = auth.info.name.split(" ")[1]
          user.email = auth.info.email
          user.password = SecureRandom.urlsafe_base64
        end
      end

      
      def upcoming_birthdays
        self.friends.birthdays_future
      end
end
