# Intro to ORMs (Object Relational Mappers)

## Agenda
- map Tweeet to the twitter database
- create methods to interact with the data such as:
  - #save ~ done
  - #update
  - #delete
  - .create
  - .all ~ done
  - .find(id)
  - .find_by_username(username)

## Tweet class

#save
* should save book to database and return the book object
* should update id of the book model with id that is associated in database

#update
* should update values in database with any updated information

.create
* should create a new row in the database and create an instance with the attributes of the database

.all
* should return all rows from the books table, converted into ruby instances.

## BONUS
.find(id)
* should locate a row in the database by id and return a ruby object associated with the attributes of the database

.find_by_username(username)
* should be able to locate a row in the database by the username

Create you own ORM with this intro repo: https://github.com/ZCohortAcct/create-orm-from-scratch-lecture

Corneal gem (for creating Sinatra apps): https://github.com/thebrianemory/corneal
