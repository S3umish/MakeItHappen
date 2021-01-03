Build Models and Migrations 
draw out your models
- their attributes 
- their relationships
- a basic flow of how your application will work
- Model classes
- Associations (& validations if you wish to use them -- you’ll at least need a
  validator to protect against duplicate login credentials across different users,
  usually username or email)
- create some seed data
- adjust migrations as needed
- add your login/signup/signout routes
- Use `shotgun` and `pry` (or `raise`/`inspect`) all the time!
Project Requirements
Build an MVC Sinatra application.
Use ActiveRecord with Sinatra.
Use multiple models.
Use at least one has_many relationship on a User model and one belongs_to relationship on another model.
Must have user accounts - users must be able to sign up, sign in, and sign out.
Validate uniqueness of user login attribute (username or email).
Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.
Ensure that users can edit and delete only their own resources - not resources created by other users.
Validate user input so bad data cannot be persisted to the database.
BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!)
