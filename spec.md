[x] Step 1: Push to Github && Host on Heroku
[x] Step 2: Model requirements
        -1 has many
                User has many events
                User has many friends through User Friends
        -1 belongs_to
                Events belong to Users
                Events belong to Friends (maybe new join table events <> attendees <> friend)
        -2 has_many :through
            User has many commented Events through Comments
            User has many friends through User Friends Userfriends
                -join table many:many between Users and Friends
[x] Step 3: Validation at model level
[x]  Step 4: Implement welcome and home page with login options
[x]  Step 5: Implement Google SSO
[x]  Step 6: Nested resource
        -a nested new form that related to parent resource
                -events will be nested under users being able to create a new event related to the logged in user
        -a nested index or show route
                -we will be able to see all of the nested events under a user and an individual event page will be nested under users/:id/events/:event_id
[x]  Step 7: Form validation with errors
        -fields with error class
[x]  Step 8: Scope method
        -scoping friends of users to ones with birthdays in the next month
[]  Step 9: DRY
        -Logic present in controllers should be encapsulated as methods in the models.
        -Views should use helper methods and partials when appropriate.
        -Follow patterns in the Rails Style Guide and the Ruby Style Guide.

V2 Next Steps:
[] Update with specs
[] Update to allow events to have multiple friends attend
[] Implement Devise Login
[] Implement Active Admin
[] Implement additional CSS