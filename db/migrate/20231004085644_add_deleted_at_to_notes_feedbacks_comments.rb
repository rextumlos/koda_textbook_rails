class AddDeletedAtToNotesFeedbacksComments < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :deleted_at, :datetime, default: nil
    add_column :feedbacks, :deleted_at, :datetime, default: nil
    add_column :comments, :deleted_at, :datetime, default: nil
  end
end
