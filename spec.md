[x] Step 1: Push to Github && Host on Heroku
[] Step 2: Implement welcome and home page with login options
[]  Step 3: Implement 2 methods of SSO (Google and Github most likely)
[]  Step 4: Model requirements
        -1 has many

        -1 belongs_to
        -2 has_many :through
            Events have many users and friends
                -location
                -date/time
                -title
            Userfriends
                -join table many:many between Users and Friends
[]  Step 5: Nested resource
        -a nested new form that related to parent resource
        -a nested index or show route
[]  Step 6: Validation at model level
[]  Step 7: Form validation with errors
        -fields with error class
[]  Step 8: Scope method
[]  Step 9: DRY
        -Logic present in controllers should be encapsulated as methods in the models.
        -Views should use helper methods and partials when appropriate.
        -Follow patterns in the Rails Style Guide and the Ruby Style Guide.