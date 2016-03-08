# Hacker News Clone Part 1

## Learning Competencies

* Use the MVC pattern in web applications with proper allocation of code and
  responsibilities to each layer
* Implement CRUD in an MVC application
* Implement user login and authentication in a web application
* Include AJAX calls using JSON objects

## Summary

Build a [Hacker News][] clone in Sinatra to demonstrate the learning compentencies listed above


## Outline

This application should include the following pages:

1. An index page listing all the posts
2. A page showing a particular post, including comments
3. A user profile page
4. A page showing all a user's submissions
5. A page showing all a user's comments
6. A user signup and login page

### Models &amp; Controllers

Include the following models:

1. `Post`
2. `User`
3. `Comment`

#### Routes

Think in a RESTful way and include the following routes:


|                             | HTTP Verb | URL                 |
|-----------------------------|-----------|---------------------|
| View all posts              | GET       | /posts              |
| View a single post          | GET       | /posts/:id          |
| Add a comment to a post     | POST      | /posts/:id/comments |
| View all comments by a user | GET       | /users/:id/comments |


### Views

Implement all the views.

### Additional

Include AJAX calls utilizing JSON objects to implement voting


## Resources

[Hacker News][]


[Hacker News]: http://news.ycombinator.com
