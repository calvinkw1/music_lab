Music Lab
=========

In this lab you'll be creating a web application for saving some of
your favorite music.  You can keep track of your favorite Artists and
your favorite Songs (as part of the bonus). Naturally, you'll be able to
Create, Read, Update, and Delete these resources.

This will be a Sinatra app and we will be utilizing our newfound
knowledge of ActiveRecord. We will be using ActiveRecord to create
our database, create tables, and interact with the database.

Research
--------

Before you start coding, look up the answers the following questions
and place them inline below:

1. What are some books that Martin Fowler has written?
    Analysis Patterns, UML Distilled, Refactoring, Refactoring, Planning Extreme Programming, Patterns of Enterprise Application Architecture, Domain-Specific Languages, NoSQL Distilled.

2. What's the difference between "active record" and "ActiveRecord"?
    The term "active record" refers to an object that wraps a row in a database table or view, provides ease of database access, and then adds domain logic on top of the data.
    ActiveRecord is the "M" or "Model" in MVC. It is the layer of the whole app/system that is responsible for representing data and logic, allowing creation and manipulation where the data requires persistent storage in a database. It uses the Active Record Pattern, which is also an Object Relational Mapping system.

3. Is the "active record" pattern an ORM?
    Yes.

4. Why might we want to use an ORM in our code?
    ORMs help speed up development by eliminating repetitive code.

5. What gem do we need to allow Sinatra to interact with ActiveRecord?
    sinatra-activerecord

6. What is `rake`?
    'Rake' is a build tool that is written in Ruby, which is similar to 'make' and others. It is simply a text file written in a certain prescribed syntax. The difference is that 'rake' does not provide an external domain specific language. All tasks are written in Ruby, giving you full flexibility and allowing you to take advantage of Ruby features.

7. What is a database migration?
    Migrations are a convenient way to alter your database structure(schema) over time in a consistent and easy way. They use a Ruby domain specific language so that you don't have to write SQL yourself, allowing your schema and changes to not have to rely on any one specific database.

8. What command can we use to create a new ActiveRecord migration?
    rake db:create_migration(name)


9. What command runs our existing migrations?
    rake db:migrate

10. What commands reverses a migration?
    rake db:rollback

11. What command tells us which migrations have run and which have
not?
    rake db:migrate:status

12. Which class do we have to extend if we want to create a new model?
    Subclass the class you want to create to the ActiveRecord::Base class.

13. What's the difference between ActiveRecord's `.new` and `.create`
methods?
    '.new' returns a new object while '.create' returns the object AND saves it to the database.

14. What's the difference between ActiveRecord's `.find` and
`.find_by` methods?
    '.find' retrieves the the object corresponding to the specified primary key that matches any of the supplied conditions.
    '.find_by' retrieves the first record that matches the conditions specified.

15. What's the difference between ActiveRecord's `.find_by` and
`.where` methods?
    No difference. They are the same, just different ways of writing. '.where' is closer to SQL syntax.

16. What ActiveRecord method do we use to change a value in the
database?
    '.save' or '.update'

17. What ActiveRecord method do we use to remove an item from the
database?
    '.destroy'

Steps
-----

### Create a Sinatra app.

Forget about ActiveRecord for this first step. Just get a Sinatra app
up and running, make sure it works, and then commit it to Git.

### Integrate ActiveRecord into your app.

Take your working Sinatra app and integrate ActiveRecord.

- Use the `sinatra-activerecord` gem.
- Create the `Rakefile` to make `rake` tasks available.
    - `rake -T` should list all the available tasks if setup properly.
- `rake db:create` should create your database if
`config/database.yml` is setup properly.

### Create the Artists table

- Create an ActiveRecord Migration for creating the Artists table.
    - Hint: `rake -T` might help you remember how.
- You'll need to run the migration in order for the table to actually
  be created.

### Create all the CRUD routes for Artists.

- GET
    - `/artists` - reads all artists
    - `/artists/new` - display a form to create a new artist
    - `/artists/:id` - reads a single artist
    - `/artists/:id/edit` - display a form to edit an artist
- POST
    - `/artists` - create a new artist in the database
- PUT
    - `/artists/:id` - update the artist with the given id.
- DELETE
    - `/artists/:id` - remove an artist from the database.

This will feel very similar to your Squad lab refactor, but instead of
writing SQL or writing your own ORM, you should use ActiveRecord to
talk to the database. For instance, instead of writing  `@conn.exec
"SELECT * FROM artists"` or implementing your own `Artist.all`, you
should use the `Artist.all` that comes built-in to ActiveRecod. Of
course, in order to do this you'll need to create the `Artist` class
that extends `ActiveRecord::Base`.

Bonus
-----

The bonus is to implement the Songs component of this app. You should
be able to add Songs to an Artist. Put another way, Artist has a
1-to-many relationship with Songs. How do you express relationships
within ActiveRecord? Implement full CRUD operations on Songs.

### Steps

You'll need:

- a migration to create the `songs` table.
- a foreign key in the `songs` table referencing the `artists` table.
- a `Song` model class
- routes such at `/artists/:artist_id/songs`,
  `/artists/:artist_id/songs/:id`, etc.

Even More Bonus
---------------

- Style it. It never hurts to practice your design skills.
- Use a `seeds.rb` file to help populate the database with initial values.
