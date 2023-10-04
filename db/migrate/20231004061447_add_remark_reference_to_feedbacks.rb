class AddRemarkReferenceToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_reference :feedbacks, :remark, foreign_key: true, null: true
  end
end
