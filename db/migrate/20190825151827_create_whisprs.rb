class CreateWhisprs < ActiveRecord::Migration[6.0]
  def change
    create_table :whisprs do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
