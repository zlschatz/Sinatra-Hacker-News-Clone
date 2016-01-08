class CreatePostVotes < ActiveRecord::Migration
  def change
    #change this to post_votes
    create_table :post_votes do |t|
      t.integer :vote, default: 1
      t.integer :post_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
