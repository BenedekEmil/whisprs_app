class AddWhisprToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :whispr_id, :integer
  end
end
