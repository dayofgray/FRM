[x] Step 1: Push to Github && Host on Heroku
[]  Step 2: Implement welcome and home page with login options
[]  Step 3: Implement Layout and basic css
[]  Step 4: Implement 2 methods of SSO (Google and Github most likely)
[]  Step 5: Model requirements
        -1 has many
                User has many events
                User has many friends through User Friends
        -1 belongs_to
                Events belong to Users
                Events belong to Friends (maybe new join table events <> attendees <> friend)
        -2 has_many :through
            User has many acquantainces (friends table) through Events
                -location
                -date/time
                -title
            User has many friends through User Friends Userfriends
                -join table many:many between Users and Friends
[]  Step 6: Nested resource
        -a nested new form that related to parent resource
        -a nested index or show route
[]  Step 7: Validation at model level
[]  Step 8: Form validation with errors
        -fields with error class
[]  Step 9: Scope method
[]  Step 10: DRY
        -Logic present in controllers should be encapsulated as methods in the models.
        -Views should use helper methods and partials when appropriate.
        -Follow patterns in the Rails Style Guide and the Ruby Style Guide.
[]  Step 11: Implement Active Admin