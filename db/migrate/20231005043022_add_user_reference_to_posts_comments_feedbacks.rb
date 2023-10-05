class AddUserReferenceToPostsCommentsFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user
    add_reference :comments, :user
    add_reference :feedbacks, :user
  end
end
