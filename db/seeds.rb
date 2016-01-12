(1..10).to_a.each do |number|
user = User.create(name: "User#{number}", email: "User#{number}@gmail.com", password: "password")
post = Post.create(title: "Post #{number}", url: "www.post#{number}.com", story: "Post#{number} description", user: user)
comment = Comment.create(content: "Comment #{number}", post: post, user: user)
# postvote = PostVote.create(vote: 1, post_id: post.id, user_id: user.id)
# commentvote = CommentVote.create(vote: 1, post_id: post.id, user_id: user.id)
end