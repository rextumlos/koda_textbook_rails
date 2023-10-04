class RemoveRemarkAddNameToRemarks < ActiveRecord::Migration[7.0]
  def change
    add_column :remarks, :name, :string
    remove_column :remarks, :remark
  end
end
