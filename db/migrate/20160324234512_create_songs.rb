class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :link
      t.references :user, index: true
      
      t.timestamps null: false
    end
  end
end
