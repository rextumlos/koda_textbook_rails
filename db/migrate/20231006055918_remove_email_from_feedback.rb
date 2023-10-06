class RemoveEmailFromFeedback < ActiveRecord::Migration[7.0]
  def change
    remove_column :feedbacks, :email
  end
end
