class RemoveRemarkFromFeedbacks < ActiveRecord::Migration[7.0]
  def change
    remove_column :feedbacks, :remark
  end
end
