class AddRemarkToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :remark, :integer, default: 0
  end
end
