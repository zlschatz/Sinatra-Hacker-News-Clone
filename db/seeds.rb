user = User.create(name:"joe", email:"joedirt@joe.com", password_hash:"1234")

post = Post.create(title:"hello", user_id: 1)

vote = PostVote.create(post_id: 1, user_id: 1)