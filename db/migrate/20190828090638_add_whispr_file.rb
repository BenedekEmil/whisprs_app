class AddWhisprFile < ActiveRecord::Migration[6.0]
  def change
    add_column :whisprs, :whispr_files, :string
  end
end
