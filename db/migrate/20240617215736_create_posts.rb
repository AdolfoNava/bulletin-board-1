class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :board_id
      t.string :title
      t.text :body
      t.date :expires_on

      t.timestamps
    end
  end
end
