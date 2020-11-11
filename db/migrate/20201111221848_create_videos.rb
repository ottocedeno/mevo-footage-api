class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :user_website
      t.string :user_email
      t.string :youtube_url
      t.boolean :verified
      t.boolean :authorized_to_share
      t.integer :category_id

      t.timestamps
    end
  end
end
