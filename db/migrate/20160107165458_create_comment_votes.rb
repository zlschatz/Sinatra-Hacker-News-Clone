class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.integer :vote, default: 1
      t.integer :post_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
