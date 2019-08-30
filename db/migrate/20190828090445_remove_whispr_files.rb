class RemoveWhisprFiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :whisprs, :whispr_files
  end
end
