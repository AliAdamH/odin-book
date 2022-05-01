# Project - Odin Book

This project is part of the **Odin Project** curriculum.
[Link to the full description](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project)
It is the final rails project of the curriculum, in the form of a bare bones Facebook clone.

<br>


## **Takeaway**

This project's goal was to practice most of what we learnt about Rails through the odin project.

The app's data model is made of six models:

* User
* FriendshipRequest
* Friendship
* Post
* Comment
* Like

<br>

The slightly tricky and the most thing about this project was setting up the friendship model between two users for which a graph would be more intuitive to use. The solution or workaround was to use a 2-row approach, as in for each friendship we save **each direction** of the friendship on a row :

<br>

1. User A want to be friend with User B.
2. User A sends a request to User B.
3. When User B accepts the request we insert *Two* rows in our friendships table.
4. For the first row we add the record : User B is friend with A.
5. For the second row we add the record :User A is friend with B.

<br>

The idea is that we'll be using two foreign keys in the friendships table each containing a user id, though they are named differently: `user_id` and `friend_id`,**both correspond to an id on the users table.**

This has the advantage of being able to simply query for a user's friend using the user's id, *instead of using a single row and using an OR statement*. But, it has the disadvantage of duplicating data.

<br>

We are also relying on Active Record and the concept of a through table :

Since we are declaring the following :
<br>

```ruby
# app/models/user.rb
has_many :friendships
has_many :friends, through: :friendships
```

Here Active Record will assume that the `:friendships` model is associated with a `friend` model so we better define that on our `friendships` model like so:

```ruby
# app/models/friendship.rb
belongs_to: :user
belongs_to: :friend, class_name: 'User'
```
<br>

It is *necessary* to use `class_name: 'User'` or else Active Record will look for a table called `friends` but that is not what we want !
Instead we use this 'trick' to *point back to the Users table* whenever we query for a user's friends. `@user.friends` for which we will grab all the corresponding friend_id's to the user's id, `user_id -> friend_id` and then match them with id's of the users Table.

<br>

## Other notes :

1. The app also implements the following features :
    * User mailing on sign up.
    * OAuth (Facebook OAuth)
    * Image uploading with [Carrierwave](https://github.com/carrierwaveuploader/carrierwave)

2. Too many redirections :
    The app could make use of AJAX to avoid all the unnecessary redirects upon POST requests, e.g: Liking a post should not refresh the entire page.